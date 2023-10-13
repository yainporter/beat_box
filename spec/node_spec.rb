require './lib/node'

RSpec.describe Node do
  it 'exists' do
    node = Node.new("dee")

    expect(node).to be_an_instance_of Node
  end

  it 'contains data' do
    node = Node.new("dee")

    expect(node.data).to eq("dee")
  end

  it 'has a next node' do
    node = Node.new("dee")
    
    expect(node.next_node).to eq(nil)
  end
end