require_relative 'header'
require_relative 'paragraphs'
require_relative 'emphasize'
require_relative 'ordered_list'
require_relative 'unordered_list'

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
    elsif @paragraph.start_with?("1. ", "2. ", "3. ", "4. ", "5. ", "6. ", "7. ", "8. ", "9. ")
      handle = OrderedList.new(@paragraph)
      paragraph = handle.parse_list
      if paragraph.include?("*")
        handle = Emphasize.new(paragraph)
        paragraph = handle.parse_emphasis
      end
    elsif @paragraph.start_with?("* ")
      handle = UnorderedList.new(@paragraph)
      paragraph = handle.parse_list
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
