class Emphasize
  attr_accessor :paragraph

  def initialize(paragraph)
    @paragraph = paragraph
  end

  def parse_emphasis
    paragraph_array = @paragraph.split("")
    count = 0
    paragraph_array.each_with_index do |char, index|
        if char == "*"
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




# if you find one *, keep going til the next one
  #emphasize everything in between

# if there is no next one leave as is
