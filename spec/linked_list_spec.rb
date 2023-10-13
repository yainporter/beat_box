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
      list.append("dee")
    
      expect(list.head.data).to eq("dee")
    end

    it 'can append more than one data' do
      list = LinkedList.new
      list.append("dee")
      data_2 = list.append("doo").data

      expect(data_2).to eq("doop")
    end

    it 'can access the next node' do
      list = LinkedList.new

      expect().to eq()
    end

  end

  it 'can count' do

    expect().to eq()
  end

  it 'can convert data to a string' do

    expect().to eq()
  end

end