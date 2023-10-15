require './lib/node'

class LinkedList
  attr_accessor :head, :count

  def initialize
    @head = nil
  end

  def append(data)
    data_array = []
    data_array << data.lines(" ")
    data_array = data_array.flatten
    while @head == nil
      @head = Node.new(data_array.shift)
      if data_array.length == 0
        break
      end
    end
      current_node = @head
      next_node = @head.next_node
      while current_node.next_node != nil
        next_node = current_node.next_node
        current_node = next_node
      end
      until data_array.length == 0
        array = data_array.shift
        current_node.next_node = Node.new(array)
        current_node = current_node.next_node
      end
  end

  def count
    if @head == nil
      count = 0 
    else
      # Count current node, then move on to the next node, like a train
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
    strings = []
    current_node = @head
    strings << current_node.data
    while current_node.next_node != nil
      current_node = current_node.next_node
      strings << current_node.data
    end
    strings.join(" ")
  end

  # prepend will look at the current node of the train at the head, then take it's place with the data passed through
  def prepend(data)
    current_node = @head
    @head = Node.new(data)
    new_head = @head
    new_head.next_node = current_node
  end

    #I will need a place holder hash to count their positions?
  def insert(pos, data)
    current_node = @head
    current_node_place = 0
    place_holder = {current_node_place => current_node}
    until current_node.next_node == nil
      current_node_place += 1
      current_node = current_node.next_node
      place_holder.store(current_node_place, current_node)
    end
    key_1 = pos - 1
    new_node = Node.new(data)
    # Split the train in half
    first_half = place_holder[key_1]
    second_half = place_holder[pos]
    # Train needs to attach at the new node before attaching to the rest of the train, because to continue, the new_node needs to know who is behind
    new_node.next_node = second_half
    first_half.next_node = new_node
  end

  # Position, how many elements to return
  def find(pos, num)
    pos = pos
    count = 0
    datas = []
    until count == num
      position = self.position(pos)
      datas << position.data
      pos += 1
      count += 1
    end
    datas.join (" ")
  end

  def pop
    current_node = @head
    pop_data = nil
    if current_node == nil
      current_node.data
      return nil
    else
      new_list = current_node
      next_node = current_node.next_node
      until next_node.next_node == nil
        current_node = next_node
        next_node = current_node.next_node
      end 
      pop_data = next_node.data
      current_node.next_node = nil
    end
    pop_data
  end

  def includes?(data)
    list = self.to_string
    list.include?(data)
  end

protected

  def position(num)
    current_node = @head
    current_node_place = 0
    place_holder = {current_node_place => current_node}
    key_1 = num - 1
    until current_node.next_node == nil
      current_node_place += 1
      current_node = current_node.next_node
      place_holder.store(current_node_place, current_node)
    end
    place_holder[num]
  end

end