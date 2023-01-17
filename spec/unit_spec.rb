require_relative '../app/multiplication_table.rb'
require_relative '../app/prime_generator.rb'

describe MultiplicationTable do
	describe ".print output" do
    context "given invalid input" do
      it "returns error for [0]" do
        table = MultiplicationTable.new(0)
        expect{ table.outputTable() }.to raise_error("Invalid input, not a prime number: 0")
      end
      it "returns error for [1]" do
        table = MultiplicationTable.new(1)
        expect{ table.outputTable() }.to raise_error("Invalid input, not a prime number: 1")
      end
      it "returns error for [1, 2]" do
        table = MultiplicationTable.new([1,2])
        expect{ table.outputTable() }.to raise_error("Invalid input, not a prime number: 1")
      end
      it "returns error for [2, 1]" do
        table = MultiplicationTable.new([2,1])
        expect{ table.outputTable() }.to raise_error("Invalid input, not a prime number: 1")
      end
      it "returns error for [-2]" do
        table = MultiplicationTable.new(-2)
        expect{ table.outputTable() }.to raise_error("Invalid input, not a prime number: -2")
      end
    end
  end
end

describe PrimeGenerator do
  describe ".print output" do
    context "given input of 2" do
      it "returns 2" do
        primeGenerator = PrimeGenerator.new()
        expect(primeGenerator.generate(2)).to eq(2)
      end
    end
  end

  describe ".print output" do
    context "given input of 3" do
      it "returns [2, 3]" do
        primeGenerator = PrimeGenerator.new()
        primeGenerator.loadPrimes()
        expect(primeGenerator.generate(3)).to eq([2,3])
      end
    end
  end
end