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
      # How do I access the next node? I know that I can access the attributes of a node if I pass in that data... DUH!! Use attr_accessor instead of attr_reader!!!
      current_node = @head
      node_2 = Node.new(data)
      current_node.next_node = node_2
    end
  end

  def count
    if @head == nil
      count = 0 
    else
      count = 1
      current_node = @head
      while current_node.next_node != nil
        current_node = current_node.next_node
        count += 1
      end
    end
    count
  end

  def to_string
    self.head.data
  end

end