require 'minitest/autorun'
require 'minitest/pride'
require './lib/tree'

class TreeTest < MiniTest::Test
  def setup
    @tree = BinarySearchTree.new
    @movie_1 = @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @movie_2 = @tree.insert(16, "Johnny English")
    @movie_3 = @tree.insert(92, "Sharknado 3")
    @movie_4 = @tree.insert(50, "Hannibal Buress: Animal Furnace")
  end

  def test_does_it_exist
    assert_instance_of BinarySearchTree, @tree
  end

  def test_it_can_call_insert_with_score_and_movie
    assert_equal 0, @movie_1
    assert_equal 1, @movie_2
    assert_equal 1, @movie_3
    assert_equal 2, @movie_4
  end

  def test_include_will_return_true_or_false
    assert @tree.include?(16)
    refute @tree.include?(72)
  end

  def test_depth_of_tree_where_score_appears
    assert_equal 1, @tree.depth_of(92)
    assert_equal 2, @tree.depth_of(50)
  end

  def test_which_movie_has_the_highest_score
    result = {"Sharknado 3"=>92}
    assert_equal result, @tree.max
    assert_equal 92, @tree.max #scoree?
  end

  def test_which_movice_has_the_lowest_score
    result = {"Johnny English"=>16}
    assert_equal result, @tree.min
    assert_equal 16, @tree.min #scoree?
  end

  def test_returns_array_of_all_movies_sorted_in_acending_order
    result = [{"Johnny English"=>16},
              {"Hannibal Buress: Animal Furnace"=>50},
              {"Bill & Ted's Excellent Adventure"=>61},
              {"Sharknado 3"=>92}]
    assert_equal result, @tree.sort
  end

  def test_loading_of_movies_text_file
    assert_equal 99, @tree.load('movies.txt')
  end

  def test_report_on_health_supporting_child_nodes_at_depth
    @tree.insert(98, "Animals United")
    @tree.insert(58, "Armageddon")
    @tree.insert(36, "Bill & Ted's Bogus Journey")
    @tree.insert(93, "Bill & Ted's Excellent Adventure")
    @tree.insert(86, "Charlie's Angels")
    @tree.insert(38, "Charlie's Country")
    @tree.insert(69, "Collateral Damage")

    assert_equal [[98, 7, 100]], @tree.health(0)
    assert_equal [[58,6,85]], @tree.health(1)
    assert_equal [[36,2,28], [93,3,42]], @tree.health(2)
  end

  def test_the_shape_of_the_tree
    assert_equal 2, tree.leaves
    assert_equal 3, tree.height
  end

  def test_deleting_a_score_from_the_tree
    assert_equal 30, @tree.delete(30)
    assert_equal nil, @tree.delete(101)
  end
end
__END__
