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

  def play

  end
end