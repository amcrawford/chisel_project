gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require '../lib/parser'

class ParserTest < MiniTest::Test
  def test_that_it_reads_input
    text = Parser.new("Hello")
    assert_equal "Hello", text.read
  end

  def test_that_it_returns_html_headers
    text = Parser.new("# Hello")
    assert_equal "<h1> Hello</h1>", text.parse
  end

  def test_that_it_returns_html_paragraph
    text = Parser.new("Hello")
    assert_equal "<p>Hello</p>", text.parse
  end

  def test_that_it_can_parse_both
    text = Parser.new("# Hello\n\n# This\n\n is a paragraph")
    assert_equal "<h1> Hello</h1><h1> This</h1><p> is a paragraph</p>", text.parse
  end

  def test_that_it_can_return_emphasis
    file = Parser.new("Hi *Hello You* Buenos")
    assert_equal "<p>Hi <em>Hello You</em> Buenos</p>", file.parse
  end

  def test_that_it_will_emphasize_and_paragraph
    text = Parser.new("# Hello\n\n# This\n\n is a *paragraph*")
    assert_equal "<h1> Hello</h1><h1> This</h1><p> is a <em>paragraph</em></p>", text.parse
  end

  def test_that_it_will_emphasize_in_header
    text = Parser.new("# *Hello*\n\n# This\n\n is a *paragraph*")
    assert_equal "<h1> <em>Hello</em></h1><h1> This</h1><p> is a <em>paragraph</em></p>", text.parse
  end

  def test_that_it_can_return_list
    file = Parser.new("* Sushi\n* Barbeque\n* Mexican")
    assert_equal "<ul><li>Sushi</li><li>Barbeque</li><li>Mexican</li></ul>", file.parse
  end

end
