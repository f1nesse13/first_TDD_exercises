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
end