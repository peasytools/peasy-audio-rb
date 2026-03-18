# peasy-audio

[![Gem Version](https://badge.fury.io/rb/peasy-audio.svg)](https://rubygems.org/gems/peasy-audio)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![GitHub stars](https://agentgif.com/badge/github/peasytools/peasy-audio-rb/stars.svg)](https://github.com/peasytools/peasy-audio-rb)

Ruby client for the [PeasyAudio](https://peasyaudio.com) API — analyze BPM, calculate bitrate, and convert audio formats. Zero dependencies beyond Ruby stdlib (Net::HTTP, JSON, URI).

Built from [PeasyAudio](https://peasyaudio.com), a comprehensive audio toolkit offering free online tools for analyzing tempo, calculating file sizes, comparing audio formats, and converting between MP3, WAV, FLAC, OGG, and AAC. The site includes in-depth guides on lossless vs. lossy audio encoding, format comparison charts, and a glossary covering concepts from bitrate and sample rate to audio codecs and clipping.

> **Try the interactive tools at [peasyaudio.com](https://peasyaudio.com)** — [Audio BPM Analyzer](https://peasyaudio.com/audio/audio-bpm/), [Audio Frequency Calculator](https://peasyaudio.com/audio/audio-freq/), [Audio File Size Calculator](https://peasyaudio.com/audio/audio-filesize/), and more.

<p align="center">
  <a href="https://agentgif.com/jN11jLwX"><img src="https://media.agentgif.com/jN11jLwX.gif" alt="peasy-audio demo — audio BPM analysis and format conversion tools in Ruby terminal" width="800"></a>
</p>

## Table of Contents

- [Install](#install)
- [Quick Start](#quick-start)
- [What You Can Do](#what-you-can-do)
  - [Audio Analysis Tools](#audio-analysis-tools)
  - [Browse Reference Content](#browse-reference-content)
  - [Search and Discovery](#search-and-discovery)
- [API Client](#api-client)
  - [Available Methods](#available-methods)
- [Learn More About Audio Tools](#learn-more-about-audio-tools)
- [Also Available](#also-available)
- [Peasy Developer Tools](#peasy-developer-tools)
- [License](#license)

## Install

```bash
gem install peasy-audio
```

Or add to your Gemfile:

```ruby
gem "peasy-audio"
```

## Quick Start

```ruby
require "peasy_audio"

client = PeasyAudio::Client.new

# List available audio tools
tools = client.list_tools
tools["results"].each do |tool|
  puts "#{tool["name"]}: #{tool["description"]}"
end
```

## What You Can Do

### Audio Analysis Tools

Digital audio is represented as a series of samples captured at a fixed rate — CD-quality audio uses 44,100 samples per second (44.1 kHz) with 16-bit depth, producing 1,411 kbps of uncompressed data. Lossy codecs like MP3 and AAC reduce this dramatically (128-320 kbps) by discarding inaudible frequencies using psychoacoustic models, while lossless codecs like FLAC compress without any data loss. PeasyAudio provides calculators and analysis tools for understanding these encoding parameters.

| Tool | Slug | Description |
|------|------|-------------|
| BPM Analyzer | `audio-bpm` | Calculate beats per minute for tempo analysis |
| Frequency Calculator | `audio-freq` | Compute audio frequency values and wavelengths |
| File Size Calculator | `audio-filesize` | Estimate file sizes for different bitrate and duration combinations |

The relationship between sample rate, bit depth, and channels determines the raw data rate of uncompressed audio. CD-quality stereo (44.1 kHz, 16-bit, 2 channels) produces 1,411.2 kbps, while studio-quality recordings at 96 kHz/24-bit stereo generate 4,608 kbps — over 34 MB per minute. Lossy codecs like AAC at 256 kbps achieve roughly 18:1 compression while maintaining transparency (indistinguishable from the original in controlled listening tests).

```ruby
require "peasy_audio"

client = PeasyAudio::Client.new

# Get the BPM analyzer tool for tempo detection
tool = client.get_tool("audio-bpm")
puts "Tool: #{tool["name"]}"              # Audio BPM analyzer name
puts "Description: #{tool["description"]}" # How BPM detection works

# List all available audio tools with pagination
tools = client.list_tools(page: 1, limit: 20)
puts "Total audio tools available: #{tools["count"]}"
```

Learn more: [Audio BPM Analyzer](https://peasyaudio.com/audio/audio-bpm/) · [Audio Format Comparison](https://peasyaudio.com/guides/audio-format-comparison/) · [Convert Between Audio Formats](https://peasyaudio.com/guides/convert-between-audio-formats/)

### Browse Reference Content

PeasyAudio includes a comprehensive glossary of audio engineering terminology and practical guides for common workflows. The glossary covers foundational concepts like bitrate (the number of bits processed per second, determining audio quality and file size), sample rate (how many times per second the audio signal is measured), WAV (Microsoft's uncompressed audio container), and FLAC (Free Lossless Audio Codec, the open-source standard for archival-quality audio).

| Term | Description |
|------|-------------|
| [Bitrate](https://peasyaudio.com/glossary/bitrate/) | Bits per second — determines audio quality and file size |
| [Sample Rate](https://peasyaudio.com/glossary/sample-rate/) | Samples per second — 44.1 kHz (CD), 48 kHz (video), 96 kHz (hi-res) |
| [WAV](https://peasyaudio.com/glossary/wav/) | Waveform Audio File Format — uncompressed PCM container |
| [FLAC](https://peasyaudio.com/glossary/flac/) | Free Lossless Audio Codec — open-source lossless compression |

The choice between lossy and lossless encoding involves a fundamental trade-off between file size and audio fidelity. Lossy codecs like MP3 and AAC use psychoacoustic models to discard sounds that fall below the human hearing threshold — frequencies masked by louder nearby tones, or ultra-high frequencies above 16 kHz that most adults cannot perceive. Lossless codecs like FLAC and ALAC preserve every sample exactly, achieving typical compression ratios of 50-60% while guaranteeing bit-perfect reconstruction of the original recording.

```ruby
require "peasy_audio"

client = PeasyAudio::Client.new

# Browse the audio glossary for encoding and format terminology
glossary = client.list_glossary(search: "bitrate")
glossary["results"].each do |term|
  puts "#{term["term"]}: #{term["definition"]}"
end

# Read a guide comparing lossless vs lossy audio formats
guide = client.get_guide("audio-format-comparison")
puts "Guide: #{guide["title"]} (Level: #{guide["audience_level"]})"
```

Learn more: [Audio Glossary](https://peasyaudio.com/glossary/) · [Audio Format Comparison](https://peasyaudio.com/guides/audio-format-comparison/) · [Convert Between Audio Formats](https://peasyaudio.com/guides/convert-between-audio-formats/)

### Search and Discovery

The API supports full-text search across all content types — tools, glossary terms, guides, use cases, and format documentation. Search results are grouped by content type, making it easy to find the right tool or reference for any audio workflow. Format conversion data covers the full matrix of source-to-target transformations, including quality trade-offs — converting from a lossy format (MP3) to another lossy format (AAC) involves a generation loss as the second encoder cannot recover information discarded by the first.

```ruby
require "peasy_audio"

client = PeasyAudio::Client.new

# Search across all audio content — tools, glossary, guides, and formats
results = client.search("convert flac")
puts "Found #{results["results"]["tools"].length} tools"
puts "Found #{results["results"]["glossary"].length} glossary terms"
puts "Found #{results["results"]["guides"].length} guides"

# Discover format conversion paths — what can WAV convert to?
conversions = client.list_conversions(source: "wav")
conversions["results"].each do |c|
  puts "#{c["source_format"]} -> #{c["target_format"]}"
end

# Get detailed information about a specific audio format
format = client.get_format("wav")
puts "#{format["name"]} (#{format["extension"]}): #{format["mime_type"]}"
```

| Format | Type | Typical Bitrate | Primary Use |
|--------|------|----------------|-------------|
| MP3 | Lossy | 128-320 kbps | Universal playback, streaming |
| AAC | Lossy | 128-256 kbps | Apple ecosystem, streaming |
| FLAC | Lossless | 800-1400 kbps | Archival, audiophile playback |
| WAV | Uncompressed | 1411 kbps (CD) | Recording, editing, mastering |

Learn more: [REST API Docs](https://peasyaudio.com/developers/) · [All Audio Tools](https://peasyaudio.com/) · [All Formats](https://peasyaudio.com/formats/)

## API Client

The client wraps the [PeasyAudio REST API](https://peasyaudio.com/developers/) using only Ruby standard library — no external dependencies.

```ruby
require "peasy_audio"

client = PeasyAudio::Client.new
# Or with a custom base URL:
# client = PeasyAudio::Client.new(base_url: "https://custom.example.com")

# List tools with pagination and filters
tools = client.list_tools(page: 1, limit: 10, search: "convert")

# Get a specific tool by slug
tool = client.get_tool("audio-convert")
puts "#{tool["name"]}: #{tool["description"]}"

# Search across all content
results = client.search("convert")
puts "Found #{results["results"]["tools"].length} tools"

# Browse the glossary
glossary = client.list_glossary(search: "mp3")
glossary["results"].each do |term|
  puts "#{term["term"]}: #{term["definition"]}"
end

# Discover guides
guides = client.list_guides(category: "audio")
guides["results"].each do |guide|
  puts "#{guide["title"]} (#{guide["audience_level"]})"
end

# List file format conversions
conversions = client.list_conversions(source: "wav")

# Get format details
format = client.get_format("wav")
puts "#{format["name"]} (#{format["extension"]}): #{format["mime_type"]}"
```

### Available Methods

| Method | Description |
|--------|-------------|
| `list_tools` | List tools (paginated, filterable) |
| `get_tool(slug)` | Get tool by slug |
| `list_categories` | List tool categories |
| `list_formats` | List file formats |
| `get_format(slug)` | Get format by slug |
| `list_conversions` | List format conversions |
| `list_glossary` | List glossary terms |
| `get_glossary_term(slug)` | Get glossary term |
| `list_guides` | List guides |
| `get_guide(slug)` | Get guide by slug |
| `list_use_cases` | List use cases |
| `search(query)` | Search across all content |
| `list_sites` | List Peasy sites |
| `openapi_spec` | Get OpenAPI specification |

All list methods accept keyword arguments: `page:`, `limit:`, `category:`, `search:`.

Full API documentation at [peasyaudio.com/developers/](https://peasyaudio.com/developers/).
OpenAPI 3.1.0 spec: [peasyaudio.com/api/openapi.json](https://peasyaudio.com/api/openapi.json).

## Learn More About Audio Tools

- **Tools**: [Audio BPM Analyzer](https://peasyaudio.com/audio/audio-bpm/) · [Audio Frequency Calculator](https://peasyaudio.com/audio/audio-freq/) · [Audio File Size Calculator](https://peasyaudio.com/audio/audio-filesize/) · [All Tools](https://peasyaudio.com/)
- **Guides**: [Audio Format Comparison](https://peasyaudio.com/guides/audio-format-comparison/) · [Convert Between Audio Formats](https://peasyaudio.com/guides/convert-between-audio-formats/) · [All Guides](https://peasyaudio.com/guides/)
- **Glossary**: [Bitrate](https://peasyaudio.com/glossary/bitrate/) · [Sample Rate](https://peasyaudio.com/glossary/sample-rate/) · [WAV](https://peasyaudio.com/glossary/wav/) · [FLAC](https://peasyaudio.com/glossary/flac/) · [All Terms](https://peasyaudio.com/glossary/)
- **Formats**: [All Formats](https://peasyaudio.com/formats/)
- **API**: [REST API Docs](https://peasyaudio.com/developers/) · [OpenAPI Spec](https://peasyaudio.com/api/openapi.json)

## Also Available

| Language | Package | Install |
|----------|---------|---------|
| **Python** | [peasy-audio](https://pypi.org/project/peasy-audio/) | `pip install "peasy-audio[all]"` |
| **TypeScript** | [peasy-audio](https://www.npmjs.com/package/peasy-audio) | `npm install peasy-audio` |
| **Go** | [peasy-audio-go](https://pkg.go.dev/github.com/peasytools/peasy-audio-go) | `go get github.com/peasytools/peasy-audio-go` |
| **Rust** | [peasy-audio](https://crates.io/crates/peasy-audio) | `cargo add peasy-audio` |

## Peasy Developer Tools

Part of the [Peasy Tools](https://peasytools.com) open-source developer ecosystem.

| Package | PyPI | npm | RubyGems | Description |
|---------|------|-----|----------|-------------|
| peasy-pdf | [PyPI](https://pypi.org/project/peasy-pdf/) | [npm](https://www.npmjs.com/package/peasy-pdf) | [Gem](https://rubygems.org/gems/peasy-pdf) | PDF merge, split, rotate, compress — [peasypdf.com](https://peasypdf.com) |
| peasy-image | [PyPI](https://pypi.org/project/peasy-image/) | [npm](https://www.npmjs.com/package/peasy-image) | [Gem](https://rubygems.org/gems/peasy-image) | Image resize, crop, convert, compress — [peasyimage.com](https://peasyimage.com) |
| **peasy-audio** | [PyPI](https://pypi.org/project/peasy-audio/) | [npm](https://www.npmjs.com/package/peasy-audio) | [Gem](https://rubygems.org/gems/peasy-audio) | **Audio trim, merge, convert, normalize — [peasyaudio.com](https://peasyaudio.com)** |
| peasy-video | [PyPI](https://pypi.org/project/peasy-video/) | [npm](https://www.npmjs.com/package/peasy-video) | [Gem](https://rubygems.org/gems/peasy-video) | Video trim, resize, thumbnails, GIF — [peasyvideo.com](https://peasyvideo.com) |
| peasy-css | [PyPI](https://pypi.org/project/peasy-css/) | [npm](https://www.npmjs.com/package/peasy-css) | [Gem](https://rubygems.org/gems/peasy-css) | CSS minify, format, analyze — [peasycss.com](https://peasycss.com) |
| peasy-compress | [PyPI](https://pypi.org/project/peasy-compress/) | [npm](https://www.npmjs.com/package/peasy-compress) | [Gem](https://rubygems.org/gems/peasy-compress) | ZIP, TAR, gzip compression — [peasytools.com](https://peasytools.com) |
| peasy-document | [PyPI](https://pypi.org/project/peasy-document/) | [npm](https://www.npmjs.com/package/peasy-document) | [Gem](https://rubygems.org/gems/peasy-document) | Markdown, HTML, CSV, JSON conversion — [peasyformats.com](https://peasyformats.com) |
| peasytext | [PyPI](https://pypi.org/project/peasytext/) | [npm](https://www.npmjs.com/package/peasytext) | [Gem](https://rubygems.org/gems/peasytext) | Text case conversion, slugify, word count — [peasytext.com](https://peasytext.com) |

## License

MIT
