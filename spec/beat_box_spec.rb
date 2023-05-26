require './lib/beat_box'
require './lib/linked_list'
require './lib/node'

RSpec.describe BeatBox do
  before :each do
    @bb = BeatBox.new
  end

  describe 'instantiation' do
    it 'exists' do
      expect(@bb).to be_a(BeatBox)
    end

    it 'has readable attributes' do
      expect(@bb.list).to be_a(LinkedList)
      expect(@bb.list.head).to eq(nil)
      expect(@bb.rate).to eq(500)
      expect(@bb.voice).to eq('Boing')
    end
  end

  describe '#append' do
    it 'can create multiple nodes' do
      expect(@bb.append('deep doo ditt')).to eq('deep doo ditt')
      expect(@bb.list.head.data).to eq('deep')
      expect(@bb.list.head.next_node.data).to eq('doo')

      expect(@bb.append('woo hoo shu')).to eq('woo hoo shu')
      expect(@bb.count).to eq(6)
    end
  end

  describe '#play' do
    it 'can play sounds in the linked list' do
      expect(@bb.append('deep doo ditt woo hoo shu')).to eq('deep doo ditt woo hoo shu')
      expect(@bb.count).to eq(6)
      expect(@bb.list.count).to eq(6)

      # expect(@bb.play).to eq(6)
    end
  end

  describe '#reset_rate' do
    it 'can reset the beat box rate' do
      @bb.append('deep doo ditt woo hoo shu')
      @bb.rate = 100
      
      expect(@bb.rate).to eq(100)

      @bb.reset_rate

      expect(@bb.rate).to eq(500)
    end
  end

  describe '#reset_voice' do
    it 'can reset the beat box voice' do
      @bb.append('deep doo ditt woo hoo shu')
      @bb.voice = 'Daniel'
      
      expect(@bb.voice).to eq('Daniel')

      @bb.reset_voice

      expect(@bb.voice).to eq('Boing')
    end
  end
end