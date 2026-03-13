# peasy-audio

[![Gem Version](https://badge.fury.io/rb/peasy-audio.svg)](https://rubygems.org/gems/peasy-audio)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

Audio processing library for Ruby — convert between formats (MP3, WAV, OGG, FLAC, AAC), trim, merge, normalize volume. FFmpeg-powered with a clean Ruby API.

Built from [Peasyaudio](https://peasyaudio.com), a free online toolkit.

## Install

```bash
gem install peasy-audio
```

## Quick Start

```ruby
require "peasy_audio"

# Check version
puts PeasyAudio::VERSION  # => "0.1.1"
```

## Also Available

| Platform | Package | Install |
|----------|---------|---------|
| **PyPI** | [peasy-audio](https://pypi.org/project/peasy-audio/) | `pip install peasy-audio` |
| **npm** | [peasy-audio](https://www.npmjs.com/package/peasy-audio) | `npm install peasy-audio` |
| **crates.io** | [peasy-audio](https://crates.io/crates/peasy-audio) | `cargo add peasy-audio` |
| **Homebrew** | [peasytools/peasy](https://github.com/peasytools/homebrew-peasy) | `brew install peasytools/peasy/peasy-audio` |

## Peasy Developer Tools

| Package | PyPI | npm | RubyGems | crates.io | Description |
|---------|------|-----|----------|-----------|-------------|
| **peasy-audio** | [PyPI](https://pypi.org/project/peasy-audio/) | [npm](https://www.npmjs.com/package/peasy-audio) | **[Gem](https://rubygems.org/gems/peasy-audio)** | [Crate](https://crates.io/crates/peasy-audio) | **Audio processing — convert, trim, merge, normalize** |
| peasy-pdf | [PyPI](https://pypi.org/project/peasy-pdf/) | [npm](https://www.npmjs.com/package/peasy-pdf) | [Gem](https://rubygems.org/gems/peasy-pdf) | [Crate](https://crates.io/crates/peasy-pdf) | PDF merge, split, compress, rotate, watermark |
| peasy-image | [PyPI](https://pypi.org/project/peasy-image/) | [npm](https://www.npmjs.com/package/peasy-image) | [Gem](https://rubygems.org/gems/peasy-image) | [Crate](https://crates.io/crates/peasy-image) | Image resize, crop, compress, convert, watermark |
| peasytext | [PyPI](https://pypi.org/project/peasytext/) | [npm](https://www.npmjs.com/package/peasytext) | [Gem](https://rubygems.org/gems/peasytext) | [Crate](https://crates.io/crates/peasytext) | Text analysis, case conversion, slugs, word count |
| peasy-css | [PyPI](https://pypi.org/project/peasy-css/) | [npm](https://www.npmjs.com/package/peasy-css) | [Gem](https://rubygems.org/gems/peasy-css) | [Crate](https://crates.io/crates/peasy-css) | CSS gradients, shadows, flexbox, grid generators |
| peasy-compress | [PyPI](https://pypi.org/project/peasy-compress/) | [npm](https://www.npmjs.com/package/peasy-compress) | [Gem](https://rubygems.org/gems/peasy-compress) | [Crate](https://crates.io/crates/peasy-compress) | Gzip, deflate, brotli compression |
| peasy-document | [PyPI](https://pypi.org/project/peasy-document/) | [npm](https://www.npmjs.com/package/peasy-document) | [Gem](https://rubygems.org/gems/peasy-document) | [Crate](https://crates.io/crates/peasy-document) | Markdown, HTML, CSV, JSON, YAML conversion |
| peasy-audio | [PyPI](https://pypi.org/project/peasy-audio/) | [npm](https://www.npmjs.com/package/peasy-audio) | [Gem](https://rubygems.org/gems/peasy-audio) | [Crate](https://crates.io/crates/peasy-audio) | Audio convert, trim, merge, normalize, effects |
| peasy-video | [PyPI](https://pypi.org/project/peasy-video/) | [npm](https://www.npmjs.com/package/peasy-video) | [Gem](https://rubygems.org/gems/peasy-video) | [Crate](https://crates.io/crates/peasy-video) | Video trim, resize, thumbnails, GIF conversion |

Part of the [Peasy](https://peasytools.com) developer tools ecosystem.

## License

MIT
