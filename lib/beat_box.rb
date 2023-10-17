require './lib/linked_list'
require './lib/node'

class BeatBox 
  attr_accessor :list

  def initialize(data = nil)
    if data != nil
    @list = LinkedList.new(Node.new(data))
    @list.head = Node.new(data)
    else
      @list  = LinkedList.new
    end
  end

  def append(data)
    self.list.append(data)
  end

  def count
    self.list.count
  end

  def to_string
    self.list.to_string
  end

  def prepend(data)
    self.list.prepend(data)
  end

  def play
    `say -r #{self.rate} -v #{self.voice} \"#{self.to_string}\"`
  end

  def rate
    150
  end

  def voice(gets)
    gets
  end

end