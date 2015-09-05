gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require '../lib/unordered_list'

class ListTest < MiniTest::Test
  def test_that_it_runs
  end

  def test_that_it_makes_unordered_list
    file = UnorderedList.new("* Sushi\n* Barbeque\n* Mexican")
    assert_equal "<ul><li>Sushi</li><li>Barbeque</li><li>Mexican</li></ul>", file.parse_list
  end
end
