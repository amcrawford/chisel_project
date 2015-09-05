class OrderedList
  attr_accessor :paragraph

  def initialize(paragraph)
    @paragraph = paragraph
  end

  def parse_list
    line_array = @paragraph.split("\n")
    new_paragraph = []
    line_array.each do |line|
      word_array = line.split(" ")
        word_array.delete_at(0)
        line = "<li>#{word_array.join(" ")}</li>"
        new_paragraph << line
      end
    @paragraph = "<ol>#{new_paragraph.join("")}</ol>"
  end

end
