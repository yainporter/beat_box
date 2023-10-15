require './lib/linked_list'
require './lib/node'
require './lib/beat_box'

RSpec.describe BeatBox do

  it 'initializes with a LinkedList' do
    bb = BeatBox.new

    expect(bb.list).to be_an_instance_of LinkedList
  end

  it 'can append data' do
    bb = BeatBox.new

    expect(bb.append("hello")).to eq (bb.list.head)
  end

  it 'can count the list of data' do
    bb = BeatBox.new
    bb.append("hello")
    bb.append("my")
    bb.append("name")
    bb.append("is")
require 'pry'; binding.pry
    expect(bb.count).to eq(4)
  end

end