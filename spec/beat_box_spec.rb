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
    bb.append("hello")
    data = bb.list.head.data
    expect(data).to eq("hello")
    expect(bb.count).to eq (1)
  end

  it 'can count the list of data' do
    bb = BeatBox.new
    bb.append("hello")
    bb.append("my")
    bb.append("name")
    bb.append("is")

    expect(bb.count).to eq(4)
  end

  it 'can turn all the data in a list to a string' do
    bb = BeatBox.new
    bb.append("hello")
    bb.append("my")
    bb.append("name")
    bb.append("is")
    bb.prepend("Yain")

    expect(bb.to_string).to eq("Yain hello my name is")
  end

  it 'can prepend data' do
    bb = BeatBox.new
    bb.append("hello")
    bb.append("my")
    bb.append("name")
    bb.append("is")
    bb.prepend("Yain")

    prepend_data = bb.list.head.data
    expect(prepend_data).to eq("Yain")

    bb.prepend("Hello my name is Yain")
    string = bb.to_string
    require 'pry'; binding.pry
    expect(string).to eq("Hello my name is Yain Yain hello my name is")
    

    
  end

end