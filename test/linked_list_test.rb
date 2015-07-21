require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'

class LinkedListTest < Minitest::Test

  def test_empty_list_can_append_node
    list = LinkedList.new
    node = Node.new("data")
    list.append(node)
    assert_equal node, list.head
  end

  def test_list_with_one_node_can_append_second_node
    list = LinkedList.new
    node = Node.new("data1")
    node2 = Node.new("data2")
    list.append(node)
    list.append(node2)
    assert_equal node2, list.head.next_node
  end

  def test_list_with_two_nodes_can_append_third_node
    list = LinkedList.new
    node = Node.new("data1")
    node2 = Node.new("data2")
    node3 = Node.new("data3")
    list.append(node)
    list.append(node2)
    list.append(node3)
    assert_equal node3, list.head.next_node.next_node
  end

  def test_prepend_node_to_list_beginning
    list = LinkedList.new
    node = Node.new("data")
    list.prepend(node)
    assert_equal node, list.head
  end

  def test_prepend_two_nodes_to_list_beginning
    list = LinkedList.new
    node1 = Node.new("Violin")
    node2 = Node.new("Cello")
    list.prepend(node1)
    list.prepend(node2)
    assert_equal node2, list.head
    assert_equal node2.next_node, node1
  end

  def test_insert_node_at_arbitrary_position
    skip
    list = LinkedList.new
    node1 = Node.new("Thunderstruck")
    node2 = Node.new("Back in Black")
    node3 = Node.new("You Shook Me All Night Long")
    list.prepend(node2)
    list.prepend(node1)
    list.insert(1, node3)
    assert_equal list.head.data, "Thunderstruck"
    assert_equal list.head.next_node.data, "You Shook Me All Night Long"

  end
end
