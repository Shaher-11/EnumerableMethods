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
end

# it "Returns enumerable when no block given" do
#   my_proc = Proc.new {|x,y| x}
#   [[1, 2], [3, 4]].each(&my_proc)

#   expect([[1, 2], [3, 4]].my_each(&my_proc)).to be_a([1,2])
# end
