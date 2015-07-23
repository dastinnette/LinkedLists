require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'

class LinkedListTest < Minitest::Test

  def test_head_starts_as_nil
    list = LinkedList.new
    assert_equal nil, list.head
  end

  def test_append_node_to_empty_list_is_head
    list = LinkedList.new
    node = Node.new
    list.append(node)
    assert_equal node, list.head
  end

  def test_append_node_to_list_with_one_item_does_not_change_head
    list = LinkedList.new
    node1 = Node.new("Violin")
    node2 = Node.new("Cello")
    list.append(node1)
    list.append(node2)
    assert_equal node1, list.head
    refute_equal node2, list.head
    assert_equal node2, list.head.next_node
  end

  def test_append_node_to_list_with_two_items_puts_third_item_at_end
    list = LinkedList.new
    node1 = Node.new("Violin")
    node2 = Node.new("Cello")
    node3 = Node.new("Viola")
    list.append(node1)
    list.append(node2)
    list.append(node3)
    assert_equal node1, list.head
    assert_equal node2, list.head.next_node
    assert_equal node3, list.head.next_node.next_node
  end

  def test_prepend_node_to_empty_list_is_head
    list = LinkedList.new
    node = Node.new
    list.prepend(node)
    assert_equal node, list.head
    assert_equal nil, list.head.next_node
  end

  def test_prepend_node_to_list_with_one_item_changes_head
    list = LinkedList.new
    node1 = Node.new("Violin")
    node2 = Node.new("Cello")
    list.prepend(node1)
    list.prepend(node2)
    assert_equal node2, list.head
    assert_equal node1, list.head.next_node
    assert_equal nil, list.head.next_node.next_node
  end

  def test_insert_node_into_empty_list_is_head
    list = LinkedList.new
    node = Node.new
    list.insert(node)
    assert_equal node, list.head
    assert_equal nil, list.head.next_node
    refute_equal node, list.head.next_node
  end

  def test_insert_node_at_head
    list = LinkedList.new
    node1 = Node.new("Violin")
    node2 = Node.new("Cello")
    list.prepend(node1)
    list.insert(node2, 0)
    assert_equal node1, list.head.next_node
    assert_equal node2, list.head
  end

  def test_insert_node_at_arbitrary_position
    list = LinkedList.new
    node1 = Node.new("Violin")
    node2 = Node.new("Cello")
    node3 = Node.new("Viola")
    list.prepend(node1)
    list.append(node2)
    list.insert(node3, 1)
    assert_equal node3, list.head.next_node
    assert_equal node1, list.head
    refute_equal node2, list.head.next_node
  end

  def test_search_for_data_in_empty_list
    list = LinkedList.new
    refute list.includes?("data")
  end

  def test_search_for_data_returns_true_for_one_item_list
    list = LinkedList.new
    node = Node.new("data")
    list.prepend(node)
    assert list.includes?(node.data)
  end

  def test_pop_from_one_item_list_creates_nil_list
    list = LinkedList.new
    node = Node.new("Violin")
    list.prepend(node)
    list.pop
    assert_equal nil, list.head
    refute list.includes?(node)
  end

  def test_pop_from_longer_list_removes_last_item_only
    list = LinkedList.new
    node1 = Node.new("Violin")
    node2 = Node.new("Cello")
    node3 = Node.new("Viola")
    list.prepend(node1)
    list.append(node2)
    list.append(node3)
    list.pop
    refute list.includes?(node3)
    assert_equal nil, list.head.next_node.next_node
  end

  def test_count_correctly_counts_empty_list
    list = LinkedList.new
    assert_equal 0, list.count
  end

  def test_count_correctly_counts_multiple_item_list
    list = LinkedList.new
    node1 = Node.new("Violin")
    node2 = Node.new("Cello")
    node3 = Node.new("Viola")
    list.prepend(node1)
    list.append(node2)
    list.append(node3)
    assert_equal 3, list.count
    assert_equal "Viola", list.head.next_node.next_node.data
  end

  def test_return_head_value_for_empty_list
    list = LinkedList.new
    assert_equal nil, list.head_value
  end

  def test_return_head_value_for_multiple_item_list
    list = LinkedList.new
    node1 = Node.new("Violin")
    node2 = Node.new("Cello")
    node3 = Node.new("Viola")
    list.prepend(node1)
    list.append(node2)
    list.append(node3)
    assert_equal "Violin", list.head_value
  end

  def test_return_tail_value_for_empty_list
    list = LinkedList.new
    assert_equal nil, list.tail_value
  end

  def test_return_tail_value_for_multiple_item_list
    list = LinkedList.new
    node1 = Node.new("Violin")
    node2 = Node.new("Cello")
    node3 = Node.new("Viola")
    list.prepend(node1)
    list.append(node2)
    list.append(node3)
    assert_equal "Viola", list.tail_value
  end

  def test_finds_value_of_empty_list
    list = LinkedList.new
    assert_equal nil, list.find_value_by_index(0)
  end

  def test_finds_value_at_specific_index
    list = LinkedList.new
    node1 = Node.new("Violin")
    node2 = Node.new("Cello")
    node3 = Node.new("Viola")
    list.prepend(node1)
    list.append(node2)
    list.append(node3)
    assert_equal "Cello", list.find_value_by_index(1)
    assert_equal "Viola", list.find_value_by_index(2)
  end

  def test_finds_position_of_first_value_occurence
    list = LinkedList.new
    node1 = Node.new("Violin")
    node2 = Node.new("Cello")
    node3 = Node.new("Viola")
    list.prepend(node1)
    list.append(node2)
    list.append(node3)
    assert_equal 1, list.find_index_by_value("Cello")
    assert_equal 2, list.find_index_by_value("Viola")
  end

  def test_removes_value_at_specific_index
    list = LinkedList.new
    node1 = Node.new("Violin")
    node2 = Node.new("Cello")
    node3 = Node.new("Viola")
    list.prepend(node1)
    list.append(node2)
    list.append(node3)
    list.remove_value_at_index(2)
    assert_equal node2, list.head.next_node
    assert_equal nil, list.head.next_node.next_node
  end

  def test_removes_first_occurence_of_specified_value
    skip
    list = LinkedList.new
    node1 = Node.new("Violin")
    node2 = Node.new("Cello")
    node3 = Node.new("Viola")
    list.prepend(node1)
    list.append(node2)
    list.append(node3)
    assert_equal 1, list.remove_value("Cello")
  end
end
