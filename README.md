# peasy-audio

[![Gem Version](https://badge.fury.io/rb/peasy-audio.svg)](https://rubygems.org/gems/peasy-audio)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

Ruby client for the [PeasyAudio](https://peasyaudio.com) API — convert, trim, merge, and normalize audio files. Zero dependencies beyond Ruby stdlib (Net::HTTP, JSON, URI).

Built from [PeasyAudio](https://peasyaudio.com), a free online audio toolkit with tools for every audio workflow — convert between MP3, WAV, OGG, FLAC, and AAC formats, trim clips, merge tracks, and normalize volume levels.

> **Try the interactive tools at [peasyaudio.com](https://peasyaudio.com)** — [Audio Tools](https://peasyaudio.com/), [Audio Glossary](https://peasyaudio.com/glossary/), [Audio Guides](https://peasyaudio.com/guides/)

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

## Learn More

- **Tools**: [Audio Convert](https://peasyaudio.com/tools/audio-convert/) · [Audio Trim](https://peasyaudio.com/tools/audio-trim/) · [All Tools](https://peasyaudio.com/)
- **Guides**: [How to Convert Audio](https://peasyaudio.com/guides/how-to-convert-audio/) · [All Guides](https://peasyaudio.com/guides/)
- **Glossary**: [What is MP3?](https://peasyaudio.com/glossary/mp3/) · [All Terms](https://peasyaudio.com/glossary/)
- **Formats**: [WAV](https://peasyaudio.com/formats/wav/) · [All Formats](https://peasyaudio.com/formats/)
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
