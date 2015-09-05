gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require '../lib/ordered_list'

class ListTest < MiniTest::Test
  def test_that_it_runs
  end

  def test_that_it_makes_ordered_list
    file = OrderedList.new("1. Sushi\n2. Barbeque\n3. Mexican")
    assert_equal "<ol><li>Sushi</li><li>Barbeque</li><li>Mexican</li></ol>", file.parse_list
  end
end
