gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require '../lib/header'

class HeaderTest < MiniTest::Test
  def test_that_it_runs
  end

  def test_that_it_can_convert_one_level_one_header
    file = Header.new("# Hello")
    assert_equal "<h1> Hello</h1>", file.parse_headers
  end

  def test_that_it_can_convert_level_one_headers_on_different_lines
    file = Header.new("# Hello\n# You!")
    assert_equal "<h1> Hello</h1>\n<h1> You!</h1>", file.parse_headers
  end

  def test_that_it_can_convert_level_two_headers
    file = Header.new("## Hello You!")
    assert_equal "<h2> Hello You!</h2>", file.parse_headers
  end

  def test_that_it_can_convert_level_one_and_two_headers
    file = Header.new("# Hello\n## You!")
    assert_equal "<h1> Hello</h1>\n<h2> You!</h2>", file.parse_headers
  end

end
