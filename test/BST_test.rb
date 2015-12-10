require "minitest/autorun"
require 'BST'
require 'pry'

class FileReaderTest < Minitest::Test

  def test_is_it_the_FileReader_class?
    test = FileReader.new

    assert_equal FileReader, test.class
  end

end


class NodeTest < Minitest::Test

  def test_is_it_the_Node_class
    node = Node.new("a")

    assert_equal Node, node.class
  end

  def test_node_created_with_data?
    node = Node.new("a")

    assert_equal "a", node.data
  end

  def test_node_created_with_nil_data?
    node = Node.new(nil)

    assert_nil node.data
  end

  def test_is_the_left_link_nil?
    node = Node.new("a")

    assert_nil node.left_link
  end

  def test_is_the_right_link_nil?
    node = Node.new("a")

    assert_nil node.right_link
  end

end



class BinarySearchTreeTest < Minitest::Test

  def test_is_it_the_BST_class?
    tree = BinarySearchTree.new
    expected = BinarySearchTree

    assert_equal expected, tree.class
  end

  def test_did_the_root_get_inserted?
    tree = BinarySearchTree.new
    tree.insert("a")

    assert_equal "a", tree.root.data
  end

  def test_did_a_node_get_inserted?
    tree = BinarySearchTree.new
    tree.insert("a")
    tree.insert("b")

    assert_equal "a", tree.root.data
    assert tree.include?("b")
  end

  def test_does_the_tree_know_its_data?
    tree = BinarySearchTree.new
    tree.insert("a")
    tree.insert("b")
    tree.insert("c")
    tree.insert("x")
    tree.insert("y")
    tree.insert("m")

    assert tree.include?("m")
    refute tree.include?("w")
    refute tree.include?("d")
  end

  def test_does_depth_return_0_for_1_node?
    tree = BinarySearchTree.new
    tree.insert("a")

    assert_equal 0, tree.depth_of("a")
  end

  def test_depth_of_data
    tree = BinarySearchTree.new
    tree.insert("a")
    tree.insert("b")
    tree.insert("c")
    tree.insert("x")
    tree.insert("y")
    tree.insert("m")

    assert_equal 0, tree.depth_of("a")
    assert_equal 1, tree.depth_of("b")
    assert_equal 2, tree.depth_of("c")
  end

  def test_will_it_take_numbers?
    tree = BinarySearchTree.new
    tree.insert(1)
    tree.insert(2)
    tree.insert(3)
    tree.insert(4)

    assert tree.include?(1)
    assert tree.include?(2)
  end

  def test_returns_the_max_value
    tree = BinarySearchTree.new
    tree.insert("a")
    tree.insert("b")
    tree.insert("c")
    tree.insert("x")
    tree.insert("y")
    tree.insert("m")

    assert_equal "y", tree.max
  end

  def test_returns_the_min_value
    tree = BinarySearchTree.new
    tree.insert("a")
    tree.insert("b")
    tree.insert("c")
    tree.insert("x")
    tree.insert("y")
    tree.insert("m")

    assert_equal "a", tree.min
  end

  def test_sorts_data_into_an_array
    tree = BinarySearchTree.new
    tree.insert("m")
    tree.insert("a")
    tree.insert("b")
    tree.insert("c")
    tree.insert("x")
    tree.insert("y")
    tree.insert("z")

    expected = ["a","b","c","m","x","y","z"]
    assert_equal expected, tree.sort
  end

  def test_data_went_left
    tree = BinarySearchTree.new
    tree.insert("m")
    tree.insert("a")
    tree.insert("b")
    tree.insert("c")
    tree.insert("x")
    tree.insert("y")
    tree.insert("z")

    assert tree.include?("a")
  end

  def test_depth_returns_0_if_just_root?
    m = BinarySearchTree.new
    m.insert("m")

    assert_equal 0, m.depth_of("m")
  end

  def test_depth_returns_1_if_root_plus_node?
    m = BinarySearchTree.new
    m.insert("m")
    m.insert("p")

    assert_equal 1, m.depth_of("p")
  end

  def test_depth_returns_2_if_root_plus_two_nodes
    m = BinarySearchTree.new
    m.insert("m")
    m.insert("p")
    m.insert("r")

    assert_equal 2, m.depth_of("r")
  end

  def test_depth_returns_3_if_root_plus_three_nodes
    m = BinarySearchTree.new
    m.insert("m")
    m.insert("p")
    m.insert("r")
    m.insert("s")

    assert_equal 3, m.depth_of("s")
  end

  # def test_data_being_inserted
  #   m = BinarySearchTree.new("m")
  #
  #   assert_equal m.right_way("z"), m.insert("z")
  # end



end
