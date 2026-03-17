# frozen_string_literal: true

# Demo script for peasy-audio-rb — Audio tools client for peasyaudio.com
# Run: ruby -I lib examples/demo.rb

require "peasy_audio"

client = PeasyAudio::Client.new

# List available audio tools
puts "=== Audio Tools ==="
tools = client.list_tools(limit: 5)
tools["results"].each do |tool|
  puts "  #{tool["name"]}: #{tool["description"]}"
end
puts "  Total: #{tools["count"]} tools"

# Get a specific tool by slug
puts "\n=== Audio BPM Tool ==="
tool = client.get_tool("audio-bpm")
puts "  Name: #{tool["name"]}"
puts "  Description: #{tool["description"]}"

# List tool categories
puts "\n=== Categories ==="
categories = client.list_categories
categories["results"].each do |cat|
  puts "  #{cat["name"]}"
end

# Search across all content
puts "\n=== Search: 'convert' ==="
results = client.search("convert")
results["results"].each do |section, items|
  puts "  #{section}: #{items.length} results" if items.is_a?(Array) && !items.empty?
end

# List glossary terms
puts "\n=== Glossary (first 3) ==="
glossary = client.list_glossary(limit: 3)
glossary["results"].each do |term|
  puts "  #{term["term"]}: #{term["definition"]&.slice(0, 80)}..."
end

# List guides
puts "\n=== Guides (first 3) ==="
guides = client.list_guides(limit: 3)
guides["results"].each do |guide|
  puts "  #{guide["title"]}"
end

puts "\nDone! Visit https://peasyaudio.com for more."
