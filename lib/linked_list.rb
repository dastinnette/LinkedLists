require './lib/node'
require 'pry'

class LinkedList

  attr_accessor :head, :next_node

  # append an element to the end of the list
  def append(node)
    current_node = @head
    if @head == nil
      @head = node
    else
      until current_node.next_node == nil
        current_node = current_node.next_node
      end
      current_node.next_node = node
    end
  end

  # prepend an element at the beginning of the list
  def prepend(node)
    node.next_node = @head
    @head = node
  end

  # insert an element at an arbitrary position in the list
  def insert(node, index = 0)
    if index > 0
      current_node  = @head
      previous_node = @head
      index.times do current_node = current_node.next_node
      end
        node.next_node = current_node
      (index-1).times do previous_node = previous_node.next_node
      end
        previous_node.next_node = node
    else #prepend it
      node.next_node = @head
      @head = node
    end
  end

  # includes? gives back true or false whether the supplied value is in the list
  def includes?(target_data)
    current_node = @head
    if @head == nil
      false
    elsif @head.next_node != nil
      until current_node.next_node == nil
        current_node = current_node.next_node
        if current_node.data = target_data
          true
        else
          false
        end
      end
    elsif @head.data = target_data
      true
    else
      false
    end
  end

  # pop an element from the end of the list
  def pop
    if @head.next_node != nil
    current_node  = @head
    previous_node = @head
    tail_position = 0
    until current_node.next_node == nil
      current_node = current_node.next_node
      tail_position += 1
    end
      (tail_position-1).times do previous_node = previous_node.next_node
      end
      previous_node.next_node = nil
    else
      @head = nil
    end
  end

  # count the number of elements in the list
  def count
    if @head != nil
    current_node = @head
    count = 0
      until current_node.next_node == nil
        current_node = current_node.next_node
        count += 1
      end
    count + 1
    else
      0
    end
  end

  # return the head value at the beginning of the list
  def head_value
    if @head != nil
      @head.data
    else
      nil
    end
  end

  # return the tail value at the end of the list
  def tail_value
    if @head != nil
    current_node  = @head
    tail_node     = @head
    tail_position = 0
    until current_node.next_node == nil
      current_node = current_node.next_node
      tail_position += 1
    end
      (tail_position).times do tail_node = tail_node.next_node
      end
      tail_node.data
    else
      nil
    end
  end

  # find_by_index find the value at a numeric position
  def find_value_by_index(index = 0)
    if index > 0
      current_node = @head
      index.times do current_node = current_node.next_node
      end
      current_node.data
    else
      @head.data if @head
    end
  end

  # find_by_value finds the position of the first occurrence of a value
  def find_index_by_value(target_data)
    if @head != nil
    current_node = @head
    index_position = 0
      until current_node.data == target_data
        current_node = current_node.next_node
        index_position += 1
      end
    index_position
    else
      nil
    end
  end

  # remove_by_index removes the value at the specified index
  def remove_value_at_index(index)

  end
  # remove_by_value removes the first occurrence of the specified value
  def remove_value
  end
end
