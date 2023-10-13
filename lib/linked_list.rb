require './lib/node'

class LinkedList
  attr_reader :head, :count

  def initialize
    @head = nil
  end

  def append(data)
    if @head == nil
      @head = Node.new(data)
    else
      # How do I access the next node? I know that I can access the attributes of a node if I pass in that data...
      current_node = @head
      node_2 = Node.new(data)
      current_node.next_node = node_2
    end
  end

  def count

  end

  def to_string

  end

end