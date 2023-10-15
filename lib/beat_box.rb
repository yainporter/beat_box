require './lib/linked_list'
require './lib/node'

class BeatBox 
  attr_accessor :list

  def initialize
    @list = LinkedList.new
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
    `say -r 500 -v Boing \"#{self.to_string}\"`
  end
end