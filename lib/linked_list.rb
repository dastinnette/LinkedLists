require './lib/node'
require 'pry'

class LinkedList

  attr_accessor :head
# append an element to the end of the list
  def append

  end
# prepend an element at the beginning of the list
  def prepend(node)
    if @head.nil?
      @head = node
    else
      node.next_node = @head
      @head = node
    end
  end
# insert an element at an arbitrary position in the list
  def insert(node)
    
  end
# includes? gives back true or false whether the supplied value is in the list
# pop an element from the end of the list
# count the number of elements in the list
# return the head value at the beginning of the list
# return the tail value at the end of the list
# find_by_index find the value at a numeric position
# find_by_value finds the position of the first occurrence of a value
# remove_by_index removes the value at the specified index
# remove_by_value removes the first occurrence of the specified value



end
