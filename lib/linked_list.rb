require './lib/node'

class LinkedList
  attr_accessor :head, :count

  def initialize(head = nil)
    @head = nil
  end

  def append(data)
    data_array = to_array(data)
    while @head == nil
      @head = Node.new(data_array.shift)
      if data_array.length == 0
        break
      end
    end
    until data_array.length == 0
      array = data_array.shift
      current_node = @head
      next_node = @head.next_node
      while current_node.next_node != nil
        next_node = current_node.next_node
        current_node = next_node
      end
      current_node.next_node = Node.new(array)
      current_node = current_node.next_node
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
    strings = []
    current_node = @head
    strings << current_node.data
    while current_node.next_node != nil
      current_node = current_node.next_node
      strings << current_node.data
    end
    strings.join(" ")
  end

  def prepend(data)
    data_array = to_array(data)
    until data_array.length == 0
    current_node = @head
    @head = Node.new(data_array.pop)
    new_head = @head
    new_head.next_node = current_node
    end
  end
  
  def insert(pos, data)
    data_array = to_array(data)
    current_node = @head
    current_node_place = 0
    index_hash = {current_node_place => current_node}
    # create the data for index_hash by looping
    until current_node.next_node == nil
      current_node_place += 1
      current_node = current_node.next_node
      index_hash.store(current_node_place, current_node)
    end
    # create separate linked list with data passed through
    data_node = Node.new(data_array.pop)
    current_node = data_node
    until data_array.length == 0
      data_node = Node.new(data_array.pop)
      data_node.next_node = current_node
      current_node = data_node
    end
    # break the train into two halves, and attach separate linked list
    break_off = pos - 1
    first_half = index_hash[break_off]
    second_half = index_hash[pos]
    first_half.next_node = data_node
    while first_half.next_node != nil
      next_node = first_half.next_node
      first_half = next_node
    end
    first_half.next_node = second_half
  end

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

  def position(num)
    current_node = @head
    current_node_place = 0
    index_hash = {current_node_place => current_node}
    # index = num - 1
    until current_node.next_node == nil
      current_node_place += 1
      current_node = current_node.next_node
      index_hash.store(current_node_place, current_node)
    end
    index_hash[num]
  end

  def to_array(data)
    data_array = []
    data_array << data.lines(' ')
    data_array = data_array.flatten
    data_array.map! {|array| array.rstrip}
  end

  def shift_array(array)
    data_array = []
    data_array << data.lines(' ')
    data_array = data_array.flatten
    data_array.map! {|array| array.rstrip}
    until data_array.length == 0
      array = data_array.shift
      current_node = @head
      next_node = @head.next_node
      while current_node.next_node != nil
        next_node = current_node.next_node
        current_node = next_node
      end
    end
  end

  def find_nil
    current_node = @head
    next_node = @head.next_node
    while current_node.next_node != nil
      next_node = current_node.next_node
      current_node = next_node
    end
  end
end