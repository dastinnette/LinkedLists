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
  end

  def test_append_node_to_list_with_two_items_puts_third_item_at_end
    list = LinkedList.new
    node1 = Node.new("Violin")
    node2 = Node.new("Cello")
    node3 = Node.new("Viola")
    list.append(node1)
    list.append(node2)
    list.append(node3)
    assert_equal node2, list.head.next_node
  end

  def test_prepend_node_to_empty_list_is_head
    list = LinkedList.new
    node = Node.new
    list.prepend(node)
    assert_equal node, list.head
  end

  def test_prepend_node_to_list_with_one_item_changes_head
    list = LinkedList.new
    node1 = Node.new("Violin")
    node2 = Node.new("Cello")
    list.prepend(node1)
    list.prepend(node2)
    assert_equal node1, list.head.next_node
  end

  def test_insert_node_into_empty_list_is_head
    list = LinkedList.new
    node = Node.new
    list.insert(node)
    assert_equal node, list.head
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
    node = Node.new("Beer")
    list.prepend(node)
    list.pop
    assert_equal nil, list.head
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
  end
end
