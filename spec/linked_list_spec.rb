require './lib/node'
require './lib/linked_list'

RSpec.describe LinkedList do
  it 'exists' do
    list = LinkedList.new

    expect(list).to be_an_instance_of LinkedList
  end

  it 'contains a head' do
    list = LinkedList.new

    expect(list.head).to eq(nil)
  end


  describe '#append' do
    it 'can append data' do
      list = LinkedList.new
      result = list.append("dee")
    
      expect(result.data).to eq("dee")
    end

    it 'can append more than one data' do
      list = LinkedList.new
      list.append("dee")
      list.append("doo")
      expect(list.to_string).to eq("dee doo")
    end

    it 'can access the next node of the next node' do
      list = LinkedList.new
      list.append("dee")
      list.append("doo")


      node_2 = list.head.next_node.next_node
      expect(node_2).to eq(nil)
    end

    it 'can append more than one data all at once' do
      list = LinkedList.new
      list.append("teehee")
      list.append("beep boop baap beee deep doop daap deee")
      
      expect(list.count).to eq(9)
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

    string = list.to_string
    expect(string).to eq("dee")
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
    list.insert(1, "wheee")

    expect(list.to_string).to eq("doop wheee dee dop")
  end
  
  it 'can find data in a list' do
    list = LinkedList.new
    list.append("dee")
    list.append("dop")
    list.append("deep")
    list.prepend("doop")  

    expect(list.find(2, 2)).to eq("dop deep")
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
    list.append("dee")
    list.append("dop")
    list.append("deep")
    list.prepend("doop")  

    expect(list.pop).to eq("deep")
    expect(list.count).to eq(3)
  end
end