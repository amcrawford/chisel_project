gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require '../lib/paragraphs'

class ParagraphsTest < MiniTest::Test
  def test_that_it_runs
  end

  def test_that_it_can_convert_one_paragraph
    file = Paragraphs.new("Hello")
    assert_equal "<p>Hello</p>", file.parse_paragraphs
  end

  def test_that_it_will_not_convert_headers
    file = Paragraphs.new("<h1> Hello</h1>")
    assert_equal "<h1> Hello</h1>", file.parse_paragraphs
  end

  def test_that_it_will_add_line_breaks
    file = Paragraphs.new("Hello everyone.\nWelcome!")
    assert_equal "<p>Hello everyone.<br>Welcome!</p>", file.parse_paragraphs
  end

end
