require './lib/node'

class LinkedList
  attr_accessor :head, :count

  def initialize(head = nil)
    @head = nil
  end

  def append(data)
    data_array = to_array(data)
    data_array = valid_beats(data_array)
    if data_array == []
      puts "Error - your beat is not valid"
    else
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
    if @head == nil
      puts "Error, no data"
    else
      strings << current_node.data
      while current_node.next_node != nil
        current_node = current_node.next_node
        strings << current_node.data
      end
      strings.join(" ")
    end
  end

  def prepend(data)
    data_array = to_array(data)
    data_array = valid_beats(data_array)
    until data_array.length == 0
    current_node = @head
    @head = Node.new(data_array.pop)
    new_head = @head
    new_head.next_node = current_node
    end
  end
  
  def insert(pos, data)
    data_array = to_array(data)
    data_array = valid_beats(data_array)
    # create separate linked list with data passed through
    data_node = Node.new(data_array.pop)
    current_node = data_node
    until data_array.length == 0
      data_node = Node.new(data_array.pop)
      data_node.next_node = current_node
      current_node = data_node
    end
    # break the train into two halves with #position, and attach separate linked list
    break_off = pos - 1
    first_half = self.position(break_off)
    second_half = self.position(pos)
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

  # Use to find the index position of the LinkedList
  def position(num)
    current_node = @head
    current_node_place = 0
    index_hash = {current_node_place => current_node}
    until current_node.next_node == nil
      current_node_place += 1
      current_node = current_node.next_node
      index_hash.store(current_node_place, current_node)
    end
    index_hash[num]
  end

  # Use to turn all data arguments to an array
  def to_array(data)
    data_array = []
    data_array << data.lines(' ')
    data_array = data_array.flatten
    data_array.map! {|array| array.rstrip}
  end

  #select with conditional block
  def valid_beats(data)
    data_array = data
    valid_beats = ["tee","dee","deep","bop", "boop","la","na","wop","weep", "wap", "wup",  "wip",  "deep", "daah", "dah", "dee", "derp", "da", "daa", "dop", "dip", "dup", "dep", "bip", "bap", "baap", "baa", "bup", "baah","buup","tip","tap","top","lee","lah","luh","lap","lip","lop","hee","haw","hip","hop","beep", "doop", "doo", "dap"]
    data_array.select! {|beat_test| valid_beats.include?(beat_test)}
    data_array 

  end
end