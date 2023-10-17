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
    bb.append("beep")
    data = bb.list.head.data
    expect(data).to eq("beep")
    expect(bb.count).to eq (1)
  end

  it 'can count the list of data' do
    bb = BeatBox.new
    bb.append("beep")
    bb.append("bop")
    bb.append("boop")
    bb.append("bap")

    expect(bb.count).to eq(4)
  end

  it 'can turn all the data in a list to a string' do
    bb = BeatBox.new
    bb.append("beep")
    bb.append("bop")
    bb.append("boop")
    bb.append("bap")

    expect(bb.to_string).to eq("beep bop boop bap")
  end

  it 'can prepend data' do
    bb = BeatBox.new
    bb.append("beep")
    bb.append("bop")
    bb.append("boop")
    bb.append("bap")
    bb.prepend("derp")

    prepend_data = bb.list.head.data
    expect(prepend_data).to eq("derp")

    bb.prepend("dee daa doo")
    string = bb.to_string
    expect(string).to eq("dee daa doo derp beep bop boop bap")  
  end

  describe 'it has a rate method' do
    it 'has a getter method for rate' do
      bb = BeatBox.new("beep")

      expect(bb.rate).to eq(150)
    end

    it 'has a setter method for rate' do
      bb = BeatBox.new("beep")
      bb.rate = 500

      expect(bb.rate).to eq(500)
    end
  end

  describe 'it has a voice method' do
    it 'has a getter method for voice' do
      bb = BeatBox.new("beep")
      
      expect(bb.voice).to eq("Boing")
    end

    it 'has a setter method for voice' do
      bb = BeatBox.new("beep")
      bb.voice = "Samantha"

      expect(bb.voice).to eq("Samantha")
    end
  end

  it 'can reset the rate' do
    bb = BeatBox.new("derp")

    expect(bb.rate).to eq(150)
    expect(bb.reset_rate).to eq(500)
  end

  it 'can reset the voice' do
  bb = BeatBox.new("derp")
  bb.voice = "Samantha"

  expect(bb.voice).to eq("Samantha")
  expect(bb.reset_voice).to eq("Boing")
  end
end