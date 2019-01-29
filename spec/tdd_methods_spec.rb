require 'rspec'
require 'tdd_methods'
describe Array do

  describe "#my_uniq" do
    it "removes duplicates from an array" do
      array = [1,2,2,3,4,4,5]
      expect(array.my_uniq).to eq([1,2,3,4,5])
    end
  end

  describe "#two_sum" do
    it 'finds pairs of positions that equal 0' do
      array = [-1, 0, 2, -2, 1]
      expect(array.two_sum).to eq([[0, 4], [2, 3]])
    end
  end
    describe "#my_transpose" do
      it 'will convert between row oriented and column oriented representations' do
        arr1 = [[0, 1, 2],[3, 4, 5],[6, 7, 8]]
        arr2 = [[0, 3, 6],[1, 4, 7],[2, 5, 8]]
        expect(arr1.my_transpose).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
        expect(arr2.my_transpose).to eq([[0, 1, 2],[3, 4, 5],[6, 7, 8]])        
      end
    end

    describe '#stock_picker' do
      it 'will return the best days to buy and sell for max profit' do
        arr1 = [1.00, 2.00, 3.00, 4.00, 5.00]
        arr2 = [4.00, 3.00, 2.00, 1.00, 5.00]
        expect(arr1.stock_picker).to eq([0, 4])
        expect(arr2.stock_picker).to eq([3, 4])

     end
    end
end

describe Towers do
  subject(:tower) { Towers.new }
  describe '#initialize' do
    it 'initializes with a new game board' do
      expect(tower.board).to eq([[3,2,1], [], []])
    end
  end

  describe '#move' do
    it 'moves the disc into the correct stack' do
      tower.move(0, 2)
      expect(tower.board).to eq([[3,2], [], [1]])
    end
    it 'throws a error if stack has no discs' do
      expect { tower.move(2,1) }.to raise_error('that stack is empty')
    end

    it 'throws an error if you try to place a bigger disc onto a smaller' do
      tower.move(0, 2)
      expect {tower.move(0,2)}.to raise_error("can't move onto a smaller disc")
    end
  end

  describe '#won?' do

    it 'is won when all discs are moved onto another tower' do
      tower.move(0, 1)
      tower.move(0, 2)
      tower.move(1, 2)
      tower.move(0, 1)
      tower.move(2, 0)
      tower.move(2, 1)
      tower.move(0, 1)

      expect(tower).to be_won
    end
  end
end