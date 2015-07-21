require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'

class LinkedListTest < Minitest::Test

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
end
