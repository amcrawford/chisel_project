gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require '../lib/emphasize'

class EmphasizeTest < MiniTest::Test
  def test_that_it_runs
  end

  def test_that_it_can_convert_italics_to_html
    file = Emphasize.new("*Hello*")
    assert_equal "<em>Hello</em>", file.parse_emphasis
  end

  def test_that_it_will_not_convert_other_words
    file = Emphasize.new("Hi *Hello You* Buenos")
    assert_equal "Hi <em>Hello You</em> Buenos", file.parse_emphasis
  end

  def test_that_it_will_convert_bold
    file = Emphasize.new("Hi **Hello You** Buenos")
    assert_equal "Hi <strong>Hello You</strong> Buenos", file.parse_emphasis
  end

  def test_that_it_will_convert_both
    file = Emphasize.new("Hi **Hello You** *Buenos*")
    assert_equal "Hi <strong>Hello You</strong> <em>Buenos</em>", file.parse_emphasis
  end

end
