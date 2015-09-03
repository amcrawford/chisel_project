class Paragraphs
  attr_accessor :paragraph

  def initialize(paragraph)
    @paragraph = paragraph
  end

  def parse_paragraphs
    if @paragraph.include?("<h")
      @paragraph
    else
      @paragraph = "<p>#{paragraph}</p>"
    end
  end

end

# Notes
  # Needs all text to have had headers converted first -- is this true?
