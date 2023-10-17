require './lib/node'
require './lib/linked_list'

RSpec.describe LinkedList do
  it 'exists' do
    list = LinkedList.new

    expect(list).to be_an_instance_of LinkedList
  end

  it 'contains a head attribute with a node' do
    list = LinkedList.new

    expect(list.head).to eq(nil)
  end


  describe '#append' do
    it 'can append data' do
      list = LinkedList.new
      result = list.append("dee")
    
      expect(list.head.data).to eq("dee")
    end

    it 'can append more than one data' do
      list = LinkedList.new
      list.append("dee")
      list.append("doo")
      expect(list.to_string).to eq("dee doo")
    end

    it 'can append more than one data at once' do
      list = LinkedList.new
      list.append("dee doo")

      expect(list.to_string).to eq("dee doo")

      list.append("beep boop bap deep doop dap dee")
      
      expect(list.to_string).to eq ("dee doo beep boop bap deep doop dap dee")
      expect(list.count).to eq(9)
    end

    it 'can access the next node of the next node' do
      list = LinkedList.new
      list.append("dee")
      list.append("doo")


      node_2 = list.head.next_node.next_node
      expect(node_2).to eq(nil)
    end
  end

  it 'can count' do
    list = LinkedList.new

    list.append("dee")
    expect(list.count).to eq(1)

    list.append("doo")
    expect(list.count).to eq(2)
  end

  it 'can convert data to a string' do
    list = LinkedList.new
    list.append("dee")

    expect(list.to_string).to eq("dee")

    list.prepend("doop wop")
    list.insert(2, "hee haw")
    expect(list.to_string).to eq("doop wop hee haw dee")
  end

  it 'can add nodes to the head of the list' do 
    list = LinkedList.new
    list.append("dee")
    list.append("dop")
    list.prepend("doop")

    head = list.head.data

    expect(head).to eq("doop")
    expect(list.count).to eq(3)
  end

  it 'can add a new data to a given position in the list' do

    list = LinkedList.new
    list.append("dee")
    list.append("dop")
    list.prepend("doop")
    list.insert(1, "wop")

    expect(list.count).to eq(4)
    expect(list.to_string).to eq("doop wop dee dop")

    list.insert(1, "dee doo dah wop wap")
    expect(list.count).to eq(9)
    expect(list.to_string). to eq("doop dee doo dah wop wap wop dee dop")

  end
  
  it 'can find data in a list' do
    list = LinkedList.new
    list.append("dee")
    list.append("dop")
    list.append("deep")
    list.prepend("doop")  

    expect(list.find(2, 2)).to eq("dop deep")
    expect(list.find(3, 1)).to eq("deep")
  end

  it 'can tell you whether the data is in the list' do
    list = LinkedList.new
    list.append("dee")
    list.append("dop")
    list.append("deep")
    list.prepend("doop")  

    expect(list.includes?("dop")).to eq(true)
  end

  it 'can remove the last element from the list and return it' do
    list = LinkedList.new

    expect(list.pop).to eq(nil)

    list.append("dee")
    list.append("dop")
    list.append("deep")
    list.prepend("doop")  

    expect(list.pop).to eq("deep")
    expect(list.count).to eq(3)

    list = LinkedList.new
    list.append("dee")

    expect(list.pop).to eq("dee")
    expect(list.count).to eq(0)
  end

  it 'can prepend data' do
    list = LinkedList.new
    list.append("dee")
    list.append("dop")
    list.append("deep")
    list.prepend("doop") 
    prepend_data = list.head.data

    expect(prepend_data).to eq("doop")
  end

  it 'can prepend more than one data at once' do
    list = LinkedList.new
    list.append("dee")
    list.prepend("doop") 
    list.prepend("dee dah derp")
    prepend_data = list.head.data

    expect(prepend_data).to eq("dee")
    expect(list.count).to eq(5)
  end

  it 'can check the beats to see if they are valid' do
  list = LinkedList.new
  list.append("test test hello")
  list.append("test test hello")

  expect(list.to_string).to eq(nil)
  expect(list.head).to eq(nil)

  list.append("derp dee test doo test")
  expect(list.count).to eq(3)
  expect(list.to_string). to eq("derp dee doo")
  end

end