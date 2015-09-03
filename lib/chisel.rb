require_relative 'parser'

class FileOpener
  attr_reader :input

  def initialize
    @input = File.open(ARGV[0]).read
    @output = File.open(ARGV[1], "w")
  end

  def print_file
    puts @input
  end

end


file = FileOpener.new
puts file.print_file
