class Emphasize
  attr_accessor :paragraph

  def initialize(paragraph)
    @paragraph = paragraph
  end

  def parse_emphasis
    paragraph_array = @paragraph.split("")
    count = 0
    paragraph_array.each_with_index do |char, index|
        if char == "*" && paragraph_array[index+1] == "*"
          if count.even?
            char.gsub!(char, "<strong>")
            paragraph_array.slice!(index + 1)
            count += 1
          else
            char.gsub!(char, "</strong>")
            paragraph_array.slice!(index+1)
            count += 1
          end
        elsif char == "*" && paragraph_array[index+1] != "*"
          if count.even?
            char.gsub!(char, "<em>")
            count += 1
          else
            char.gsub!(char, "</em>")
            count += 1
          end
        end
      end
      @paragraph = paragraph_array.join("")
    end

end
