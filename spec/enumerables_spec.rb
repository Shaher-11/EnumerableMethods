require_relative '../enumerables'
describe Enumerable do
    describe "#my_each" do
      
      it "Returns enumerable when no block given" do
        expect((1..5).my_each).to be_a(Enumerable)
      end
      
      it "Returns itself when block given" do
        expect((1..5).my_each {|e| e}).to eq((1..5))
        expect({key1:10, key2:'Felix'}.my_each {|e| e}).to eq({key1:10, key2:'Felix'})
      end
    end
end