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
      format_type = "header"
    else
     format_type = "paragraph"
    # what about lists
    # font
    end
    format_type
  end


end
