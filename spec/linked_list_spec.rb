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

  it 'can append data' do
    list = LinkedList.new
    
    expect(list.append("dee")).to eq()
  end

  it 'can access the next node' do

    expect().to eq()
  end

  it 'can count' do

    expect().to eq()
  end

  it 'can convert data to a string' do

    expect().to eq()
  end

end