require './lib/node'

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(data)
    if @head == nil
      @head = Node.new(data)
    else
      # How do I access the next node? I know that I can access the attributes of a node if I pass in that data...
      current_node = @head
      if current_node.next_node == nil
        current_data = current_node.data
        @head = Node.new(current_data, Node.new(data))
      end
    end
  end

  def count

  end

  def to_string

  end

end