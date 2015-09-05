require_relative 'splitter'
require_relative 'format_reader'



class Parser
  attr_accessor :input

  def initialize(input)
    @input = input
  end

  def read
    @input
  end

  def parse
    paragraphs = @input.split("\n\n")
    final_text = []
    paragraphs.each do |paragraph|
      paragraph_format = FormatReader.new(paragraph)
      paragraph = paragraph_format.determine_format
      final_text << paragraph
    end
      final_text.join("")
  end


end

# # Testing
# text = Parser.new("# My Life in Desserts
#
# ## Chapter 1: The Beginning
#
# 'You just *have* to try the cheesecake,' he said. 'Ever since it appeared in
# **Food & Wine** this place has been packed every night.'")
# puts text.parse

# Notes
  # Still Need:
    # Edge cases: &, etc
    # Clean-up? (newlines>)
    # Delete splitter?
