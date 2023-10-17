require './lib/node'

class LinkedList
  attr_accessor :head, :count

  def initialize(head = nil)
    @head = nil
  end

  def append(beat)
    beats_array = to_array(beat)
    beats_array = valid_beats(beats_array)
    if beats_array == []
      puts "Error - your beat is not valid"
    else
      while @head == nil
        @head = Node.new(beats_array.shift)
        if beats_array.length == 0
          break
        end
      end
      until beats_array.length == 0 
        beat_from_array = beats_array.shift
        current_node = @head
        until current_node.next_node == nil
          current_node = current_node.next_node
        end
        current_node.next_node = Node.new(beat_from_array)
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
    beats_to_string = []
    current_node = @head
    if @head == nil
      puts "Error, no data"
    else
      beats_to_string << current_node.data
      while current_node.next_node != nil
        current_node = current_node.next_node
        beats_to_string << current_node.data
      end
      beats_to_string.join(" ")
    end
  end

  def prepend(beat)
    beats_array = to_array(beat)
    beats_array = valid_beats(beats_array)
    until beats_array.length == 0
    current_node = @head
    @head = Node.new(beats_array.pop)
    new_head = @head
    new_head.next_node = current_node
    end
  end
  
  def insert(pos, beat)
    data_array = to_array(beat)
    data_array = valid_beats(data_array)
    # create separate linked list with beat passed through
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
    until first_half.next_node == nil
      next_node = first_half.next_node
      first_half = next_node
    end
    first_half.next_node = second_half
  end

  def find(index, num)
  index = index
    count = 0
    beats_array = []
    until count == num
      index_position = self.position(index)
      beats_array << index_position.data
      index += 1
      count += 1
    end
    beats_array.join(" ")
  end

  def pop
    current_node = @head
    if current_node == nil
      return nil
    elsif current_node.next_node == nil
      pop_beat = current_node.data
      @head = nil
    else
      next_node = current_node.next_node
      until next_node.next_node == nil 
        current_node = current_node.next_node
        next_node = current_node.next_node
      end 
      pop_beat = next_node.data
      current_node.next_node = nil
    end
    pop_beat
  end

  def includes?(beat)
    list = self.to_string
    list.include?(beat)
  end

  # Use to find the index position of the LinkedList
  def position(index)
    current_node = @head
    current_node_place = 0
    index_hash = {current_node_place => current_node}
    until current_node.next_node == nil
      current_node_place += 1
      current_node = current_node.next_node
      index_hash.store(current_node_place, current_node)
    end
    index_hash[index]
  end

  # Use to turn all data arguments to an array
  def to_array(beat)
    beats_array = []
    beats_array << beat.lines(' ')
    beats_array = beats_array.flatten
    beats_array.map! {|array| array.rstrip}
  end

  #select with conditional block
  def valid_beats(beat)
    beats_array = beat
    valid_beats = ["tee","dee","deep","bop", "boop","la","na","wop","weep", "wap", "wup",  "wip",  "deep", "daah", "dah", "dee", "derp", "da", "daa", "dop", "dip", "dup", "dep", "bip", "bap", "baap", "baa", "bup", "baah","buup","tip","tap","top","lee","lah","luh","lap","lip","lop","hee","haw","hip","hop","beep", "doop", "doo", "dap"]
    beats_array.select! {|beat_tested| valid_beats.include?(beat_tested)}
    beats_array
  end
end