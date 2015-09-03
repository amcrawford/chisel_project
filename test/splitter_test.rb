gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require '../lib/splitter'

class SplitterTest < MiniTest::Test
  def test_that_it_takes_input
    text = Splitter.new("Hello")
    assert_equal ["Hello"], text.split_by_paragraph
  end

  def test_that_it_returns_array
    text = Splitter.new("Hello")
    assert_equal ["Hello"], text.split_by_paragraph
  end

  def test_that_it_splits_two_paragraphs
    text = Splitter.new("Hello\n\nYou")
    assert_equal ["Hello", "You"], text.split_by_paragraph
  end

  def test_that_it_does_not_split_lines
    text = Splitter.new("Hello\nYou")
    assert_equal ["Hello\nYou"], text.split_by_paragraph
  end

  def test_that_it_splits_multiple_paragraphs
    text = Splitter.new("Hello\n\nYou\n\n!")
    assert_equal ["Hello", "You", "!"], text.split_by_paragraph
  end


end
