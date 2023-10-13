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
      # How do I access the next node?
    end

  end
require 'pry'; binding.pry
  def count

  end

  def to_string

  end

end