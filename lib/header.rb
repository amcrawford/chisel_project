class Header
  attr_accessor :paragraph

  def initialize(paragraph)
    @paragraph = paragraph
  end

  def parse_headers
    lines = @paragraph.split("\n")
    lines.each do |line|
      header_number = line.split(" ")[0].size
      line.gsub!(("#"*header_number),"<h#{header_number}>")
      line << ("</h#{header_number}>")
    end
    @paragraph = lines.join("")
  end
end
