require_relative '../enumerables'
describe Enumerable do
  describe '#my_each' do
    it 'Returns enumerable when no block given' do
      expect((1..5).my_each).to be_a(Enumerable)
    end
    it 'Returns the hash items  aftr iteration' do
      expect({ key1: 10, key2: 'Felix' }.my_each { |e| e }).to eq({ key1: 10, key2: 'Felix' })
    end
    it 'Returns itself when block given' do
      expect([1, 2, 3].my_each { |e| e }).to eq([1, 2, 3])
    end

    it 'Returns the items in arry of strings' do
      expect(%w[shaher and felix tests].my_each { |e| e }).to eq(%w[shaher and felix tests])
    end
  end

  describe 'my_each_with_index' do
    it 'prints the elements in the array with their indeces' do
      expect do
        [1, 2, 5].my_each_with_index do |el, idx|
          puts el.to_s + ' ' + idx.to_s
        end
      end.to output("1 0\n2 1\n5 2\n").to_stdout
    end

    it 'prints the elements in the range with their indeces' do
      expect do
        (1..5).my_each_with_index do |el, idx|
          puts el.to_s + ' ' + idx.to_s
        end
      end.to output("1 0\n2 1\n3 2\n4 3\n5 4\n").to_stdout
    end

    it 'Returns enumerable when no block given' do
      expect((1..5).my_each_with_index).to be_a(Enumerable)
    end
    it 'Returns the hash aftr iteration' do
      expect({ key1: 10, key2: 'Felix' }.my_each_with_index { |e| e }).to eq({ key1: 10, key2: 'Felix' })
    end

    it 'should print the items in the array of strings with their indeces' do
      expect do
        %w[shaher and felix tests].my_each_with_index do |x, index|
          puts x.to_s + ' ' + index.to_s
        end
      end.to output("shaher 0\nand 1\nfelix 2\ntests 3\n").to_stdout
    end
  end

  describe '#my_select' do
    it 'Returns my_select object if no block given' do
      expect((1..3).my_select).to be_a(Enumerable)
    end

    it 'Selects even numbers from array of numbers' do
      expect([2,3,4,6,9].my_select{|el| el%2 == 0}).to eq([2,4,6])
    end

    it 'Selects even numbers from array of numbers' do
      expect(%w[felix shaher test code].my_select{|el| el.length > 4}).to eq(%w[felix shaher])
    end
  
    it 'Selects even numbers from array of numbers' do
      expect({k1:10, k2:9, k3:8, k4:7}.my_select{|k,v| v%2 == 1}).to eq([[:k2, 9], [:k4, 7]])
    end
  
    it 'Returns an array out of given range' do
      expect((1..3).my_select { |el| el }).to eq([1,2,3])
    end
  end

  describe "#my_any?" do 

    it "returns true if any number is greater than three in the given array" do
    expect([11, 12, 14].my_any?{|el| el > 3}).to be(true)
  end
  it "returns false if any number is less than three in the given array" do
    expect([11, 12, 14].my_any?{|el| el < 3}).to be(false)
  end
  it "returns false if any word less than 3 chracters " do
    expect(%w[felix shaher test code].my_any?{|el| el.length < 3}).to be(false)
  end
  it "returns true if any word greater than 3 chracters " do
    expect(%w[felix shaher test code].my_any?{|el| el.length > 3}).to be(true)
  end
end 
end



# it "Returns enumerable when no block given" do
#   my_proc = Proc.new {|x,y| x}
#   [[1, 2], [3, 4]].each(&my_proc)

#   expect([[1, 2], [3, 4]].my_each(&my_proc)).to be_a([1,2])
# end
