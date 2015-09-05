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
      @paragraph.gsub!("\n", "<br>")
    end
  @paragraph
  end

end
