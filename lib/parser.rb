require_relative 'splitter'
require_relative 'format_reader'
require_relative 'header'
require_relative 'paragraphs'

class Parser
  attr_accessor :input

  def initialize(input)
    @input = input
  end

  def read
    @input
  end

  def parse
    lines = Splitter.new(@input)
    paragraphs = lines.split_by_paragraph
    paragraph_type = ""
    final_text = []
    paragraphs.each do |paragraph|
      loop do
      paragraph_format = FormatReader.new(paragraph)
      paragraph_type = paragraph_format.determine_format
          if paragraph_type == "header"
            handle = Header.new(paragraph)
            paragraph = handle.parse_headers
          elsif paragraph_type == "paragraph"
            handle = Paragraphs.new(paragraph)
            paragraph = handle.parse_paragraphs
          end
        break if paragraph_type != "header" || paragraph_type != "paragraph"
        end
        final_text << paragraph
      # Convert blocks
          #if "header" call Header class
    end
    final_text
    # join final text
  end


end


text = Parser.new("# My Life in Desserts

## Chapter 1: The Beginning

'You just *have* to try the cheesecake,' he said. 'Ever since it appeared in
**Food & Wine** this place has been packed every night.'")
puts text.parse
