require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'


class NodeTest < Minitest::Test

  def test_node_is_head
    node = Node.new("data")
    assert node.next_node.nil?
  end

  def test_node_has_data
    data = 12
    node = Node.new(data)
    assert node.data == 12
  end

  def test_node_points_to_another_node
    node1 = Node.new("Peyton Manning", nil)
    node2 = Node.new("Broncos", node1)
    assert node2.data == "Broncos"
    assert node2.next_node.data == "Peyton Manning"
  end

  def test_finds_tail
    node1 = Node.new("Andrew Luck", nil)
    node2 = Node.new("Colts", node1)
    assert node2.next_node.tail?
  end

  def test_data_is_empty
    node1 = Node.new(nil)
    node2 = Node.new("")
    node3 = Node.new([])
    assert node1.empty?
    assert node2.empty?
    assert node3.empty?
  end
end
