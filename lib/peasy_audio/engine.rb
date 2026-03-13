# frozen_string_literal: true

require "open3"
require "json"
require "tempfile"

module PeasyAudio
  FORMATS = %w[mp3 wav ogg flac aac m4a].freeze

  module_function

  def info(path)
    cmd = %W[ffprobe -v quiet -print_format json -show_format -show_streams #{path}]
    out, err, st = Open3.capture3(*cmd)
    raise Error, "ffprobe failed: #{err}" unless st.success?
    data = JSON.parse(out)
    fmt = data["format"] || {}
    stream = (data["streams"] || []).find { |s| s["codec_type"] == "audio" } || {}
    {
      duration: fmt["duration"]&.to_f,
      format: fmt["format_name"],
      sample_rate: stream["sample_rate"]&.to_i,
      channels: stream["channels"]&.to_i,
      bitrate: fmt["bit_rate"]&.to_i,
      size: fmt["size"]&.to_i,
    }
  end

  def convert(input, format:, output: nil)
    raise Error, "unsupported format: #{format}" unless FORMATS.include?(format.to_s)
    output ||= input.to_s.sub(/\.\w+$/, ".#{format}")
    _o, err, st = Open3.capture3("ffmpeg", "-y", "-i", input.to_s, output)
    raise Error, "convert failed: #{err}" unless st.success?
    output
  end

  def trim(input, start: 0, duration: nil, output: nil)
    output ||= input.to_s.sub(/(\.\w+)$/, "_trimmed\\1")
    args = ["ffmpeg", "-y", "-i", input.to_s, "-ss", start.to_s]
    args += ["-t", duration.to_s] if duration
    args << output
    _o, err, st = Open3.capture3(*args)
    raise Error, "trim failed: #{err}" unless st.success?
    output
  end

  def merge(inputs, output: nil)
    output ||= "merged_#{Time.now.to_i}.mp3"
    list = Tempfile.new(["concat", ".txt"])
    inputs.each { |f| list.puts("file '#{File.expand_path(f)}'") }
    list.close
    _o, err, st = Open3.capture3("ffmpeg", "-y", "-f", "concat", "-safe", "0", "-i", list.path, "-c", "copy", output)
    raise Error, "merge failed: #{err}" unless st.success?
    output
  ensure
    list&.unlink
  end

  def normalize(input, output: nil)
    output ||= input.to_s.sub(/(\.\w+)$/, "_normalized\\1")
    _o, err, st = Open3.capture3("ffmpeg", "-y", "-i", input.to_s, "-af", "loudnorm", output)
    raise Error, "normalize failed: #{err}" unless st.success?
    output
  end

  class Error < StandardError; end
end
