gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require '../lib/chisel'

class ChiselTest < MiniTest::Test
  def test_that_it_prints_file
    file = FileOpener.new
    puts file.print_file
  end
end
