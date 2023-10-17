require './lib/linked_list'
require './lib/node'

class BeatBox 
  attr_accessor :list

  def initialize(beat = nil)
    if beat != nil
    @list = LinkedList.new(Node.new(beat))
    @list.head = Node.new(beat)
    @rate = 150
    @voice = "Boing"
    else
      @list  = LinkedList.new
    end
  end

  def append(beat)
    self.list.append(beat)
  end

  def count
    self.list.count
  end

  def to_string
    self.list.to_string
  end

  def prepend(beat)
    self.list.prepend(beat)
  end

  def play
    `say -r #{self.rate} -v #{self.voice} \"#{self.to_string}\"`
  end

  def pop
    self.list.pop
  end

  def insert(pos, num)
    self.list.insert(pos,num)
  end

# rate getter
  def rate
    @rate
  end

# rate setter
  def rate=(rate)
    @rate = rate
  end

  # voice getter
  def voice
    @voice
  end

  # voice setter
  def voice=(voice)
    @voice = voice
  end

  def reset_rate
    @rate = 500
  end

  def reset_voice
    @voice = "Boing"
  end

end