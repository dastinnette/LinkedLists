class Node

  attr_accessor :data, :next_node

  def initialize(data, next_node = nil)
    @data      = data
    @next_node = next_node
  end

  def empty?
    data.nil? || data.empty?
  end

  def tail?
    next_node.nil?
  end
end
