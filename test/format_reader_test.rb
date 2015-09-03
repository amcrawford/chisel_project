gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require '../lib/format_reader'

class FormatReaderTest < MiniTest::Test
  def test_that_it_runs
  end

  def test_that_it_takes_input
    text = FormatReader.new("Hello")
    assert_equal "Hello", text.read
  end

  # def test_that_it_can_identify_headers
  #   text = FormatReader.new("# Hello")
  #   assert_equal "header", text.determine_format
  # end
  #
  # def test_that_it_can_skip_words_with_hashes
  #   text = FormatReader.new("Every day #yolo")
  #   refute_equal "header", text.determine_format
  # end
  #
  # def test_that_it_can_identify_different_level_headers
  #   text = FormatReader.new("## Hello")
  #   assert_equal "header", text.determine_format
  # end
  #
  # def test_that_it_can_identify_paragraphs
  #   text = FormatReader.new("Hello")
  #   assert_equal "paragraph", text.determine_format
  # end
  #
  # def test_that_it_can_identify_emphasis
  #   text = FormatReader.new("*Hello*")
  #   assert_equal "emphasis", text.determine_format
  # end
  #
  # def test_that_it_will_identify_headers_first
  #   text = FormatReader.new("## *Hello*")
  #   assert_equal "header", text.determine_format
  # end
  #
  # def test_that_it_will_not_call_lists_emphasis
  #   skip
  #   ##
  # end

  def test_that_it_calls_Header
    skip
    text = FormatReader.new("Hello")
    assert_equal ["Hello"], text.determine_format
  end

  def test_that_it_returns_html_headers
    text = FormatReader.new("# Hello")
    assert_equal "<h1> Hello</h1>", text.determine_format
  end

  def test_that_it_calls_paragraph
    text = FormatReader.new("Hello")
    assert_equal "<p>Hello</p>", text.determine_format
  end

  def test_that_it_returns_html_paragraphs
    text = FormatReader.new("Hello")
    assert_equal "<p>Hello</p>", text.determine_format
  end

  def test_that_it_can_call_emphasis
    file = FormatReader.new("Hi *Hello You* Buenos")
    assert_equal "<p>Hi <em>Hello You</em> Buenos</p>", file.determine_format
  end

end
