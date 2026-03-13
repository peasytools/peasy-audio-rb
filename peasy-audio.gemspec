# frozen_string_literal: true

require_relative "lib/peasy_audio/version"

Gem::Specification.new do |s|
  s.name        = "peasy-audio"
  s.version     = PeasyAudio::VERSION
  s.summary     = "Audio processing — convert, trim, merge, normalize"
  s.description = "Audio processing library for Ruby — convert between formats (MP3, WAV, OGG, FLAC, AAC), trim, merge, normalize volume. FFmpeg-powered with a clean Ruby API."
  s.authors     = ["PeasyTools"]
  s.email       = ["hello@peasytools.com"]
  s.homepage    = "https://peasyaudio.com"
  s.license     = "MIT"
  s.required_ruby_version = ">= 3.0"

  s.files = Dir["lib/**/*.rb"]

  s.metadata = {
    "homepage_uri"      => "https://peasyaudio.com",
    "source_code_uri"   => "https://github.com/peasytools/peasy-audio-rb",
    "changelog_uri"     => "https://github.com/peasytools/peasy-audio-rb/blob/main/CHANGELOG.md",
    "documentation_uri" => "https://peasyaudio.com",
    "bug_tracker_uri"   => "https://github.com/peasytools/peasy-audio-rb/issues",
  }
end
