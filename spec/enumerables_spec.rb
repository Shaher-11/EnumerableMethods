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
  it 'retrns true if any of the hash values is an odd number' do
    expect({k1:10, k2:9, k3:8, k4:7}.my_any?{|k,v| v%2 == 1}).to eq(true)
  end
  it 'retrns true if any of the hash values is greater than 12' do
    expect({k1:10, k2:9, k3:8, k4:7}.my_any?{|k,v| v > 12}).to eq(false)
  end
  it "returns true if the a character exists in the string " do
    expect(%w[felix shaher test code].my_any?(/a/)).to be(true)
  end
  it "returns false if the b character does not exist in the string " do
    expect(%w[felix shaher test code].my_any?(/b/)).to be(false)
  end
end 

describe "#my_none?" do
  it "returns false if none of numbers is less than 20 in the given array" do
  expect([11, 12, 14].my_none?{|el| el < 20}).to be(false)
end
it "returns true if none of numbers is greater than 20 in the given array" do
  expect([11, 12, 14].my_none?{|el| el > 20}).to be(true)
end
it "returns true if none of words less than 3 chracters " do
  expect(%w[felix shaher test code].my_none?{|el| el.length < 3}).to be(true)
end
end

describe "#my_count" do
  it "counts the even numbers in a given array" do
    expect([11, 12, 14, 9, 8].my_count{|el| el.even?}).to be(3)
  end
  it "counts the words in a string that is longer than 4 characters " do
    expect(%w[felix shaher test code].my_count{|el| el.length > 4}).to be(2)
  end
  it 'counts the number of hash values that are odd number' do
    expect({k1:10, k2:9, k3:8, k4:7}.my_count{|k,v| v%2 == 1}).to eq(2)
  end
  it "counts the number os words has the b character " do
    expect(%w[felix shaher test code].my_count(/b/)).to be(0)
  end

  it "counts the number of times the number three in the array " do
    expect([1, 2, 3, 4, 3, 3].my_count(3)).to be(3)
  end
  it "counts the number of the words in a given array " do
    expect(%w[felix shaher test code].my_count{|word| word.count(word)}).to be(4)
  end

  it "counts the number of the elemnts in the array " do
    expect([1, 2, 4, 3].my_count).to be(4)
  end
end 
end



# it "Returns enumerable when no block given" do
#   my_proc = Proc.new {|x,y| x}
#   [[1, 2], [3, 4]].each(&my_proc)

#   expect([[1, 2], [3, 4]].my_each(&my_proc)).to be_a([1,2])
# end
