class Splitter
  attr_accessor :input

  def initialize(input)
    @input = input
  end

  def split_by_paragraph
    @input.split("\n\n")
  end

  def split_by__line
    @input.split("\n")
  end

end
