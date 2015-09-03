require_relative 'header'
require_relative 'paragraphs'
require_relative 'emphasize'

class FormatReader
  attr_accessor :paragraph

  def initialize(paragraph)
    @paragraph = paragraph
  end

  def read
      @paragraph
  end

  def determine_format
    if @paragraph.start_with?("#")
      handle = Header.new(@paragraph)
      paragraph = handle.parse_headers
      if paragraph.include?("*")
        handle = Emphasize.new(paragraph)
        paragraph = handle.parse_emphasis
      end
    else
      handle = Paragraphs.new(@paragraph)
      paragraph = handle.parse_paragraphs
      if paragraph.include?("*")
        handle = Emphasize.new(paragraph)
        paragraph = handle.parse_emphasis
      end
    end
    paragraph
  end


end
