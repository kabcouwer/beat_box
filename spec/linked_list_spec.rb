require './lib/linked_list'
require './lib/node'

RSpec.describe LinkedList do
  before :each do
    @list = LinkedList.new
  end

  describe 'instantiation' do
    it 'exists' do
      expect(@list).to be_a(LinkedList)
    end

    it 'has readable attributes' do
      expect(@list.head).to eq(nil)
    end
  end

  describe '#append' do
    it 'can create the head of the list' do
      @list.append('doop')

      expect(@list.head).to be_a(Node)

      head = @list.head

      expect(head.data).to eq('doop')
      expect(head.next_node).to eq(nil)
    end

    it 'can add a new piece of data to the list' do
      @list.append('doop')
      @list.append('deep')

      expect(@list.head.data).to eq('doop')
      expect(@list.head.next_node).to be_a(Node)

      node2 = @list.head.next_node

      expect(node2.data).to eq('deep')
      expect(node2.next_node).to eq(nil)
    end
  end

  describe '#count' do
    it 'can count how many nodes are in a list' do
      empty_list = LinkedList.new

      expect(empty_list.count).to eq(0)

      @list.append('doop')

      expect(@list.count).to eq(1)

      @list.append('deep')

      expect(@list.count).to eq(2)
    end
  end

  describe '#to_string' do
    it 'can generate a string of all elements in a list' do
      empty_list = LinkedList.new

      expect(empty_list.to_string).to eq('')

      @list.append('doop')

      expect(@list.to_string).to eq('doop')

      @list.append('deep')

      expect(@list.to_string).to eq('doop deep')
    end
  end

  describe '#prepend' do
    it 'can add node to beginning of list' do
      @list.append('plop')

      expect(@list.to_string).to eq('plop')

      @list.append("suu")
      @list.prepend("dop")

      expect(@list.to_string).to eq('dop plop suu')
      expect(@list.count).to eq(3)
    end
  end

  describe '#insert' do
    it 'can insert an element at a given position' do
      @list.append('plop')
      @list.append("suu")
      @list.prepend("dop")
      @list.insert(1, "woo")
      
      expect(@list.to_string).to eq('dop woo plop suu')
    end
  end
end