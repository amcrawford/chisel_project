gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require '../lib/format_reader'

class ParserTest < MiniTest::Test
  def test_that_it_runs
  end

  def test_that_it_takes_input
    text = FormatReader.new("Hello")
    assert_equal "Hello", text.read
  end

  def test_that_it_can_identify_headers
    text = FormatReader.new("# Hello")
    assert_equal "header", text.determine_format
  end

  def test_that_it_can_skip_words_with_hashes
    text = FormatReader.new("Every day #yolo")
    refute_equal "header", text.determine_format
  end

  def test_that_it_can_identify_different_level_headers
    text = FormatReader.new("## Hello")
    assert_equal "header", text.determine_format
  end

  def test_that_it_can_identify_paragraphs
    text = FormatReader.new("Hello")
    assert_equal "paragraph", text.determine_format
  end

end
