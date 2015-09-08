require_relative 'parser'

class FileOpener
  attr_accessor :input, :output, :final_text

  def initialize(input, output)
    @input = File.open(ARGV[0]).read
    @output = File.open(ARGV[1], "w")
    @final_text = ""
  end

  def print_file
    puts @input
  end

  def translate
    handle = Parser.new(@input)
    @final_text = handle.parse
  end

  def write
    @output.write(@final_text)
  end

end


file = FileOpener.new(ARGV[0], ARGV[1])
translated_file = file.translate
final_file = file.write
puts "Converted #{ARGV[0]} (#{file.input.split("\n").length} lines) to #{ARGV[1]}"
