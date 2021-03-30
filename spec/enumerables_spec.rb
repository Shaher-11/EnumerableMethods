require_relative '../enumerables'
describe Enumerable do
    describe "#my_each" do
      
      it "prints the elemsnt in the given range" do
        expect((1..5).my_each).to be_a(Enumerable)
      end
    end
end