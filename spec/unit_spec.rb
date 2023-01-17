require_relative '../app/multiplication_table.rb'
require_relative '../app/prime_generator.rb'

describe MultiplicationTable do
	describe ".generate table" do
    context "given invalid input" do
      it "returns error for [0]" do
        table = MultiplicationTable.new(0)
        expect{ table.generateTable() }.to raise_error("Invalid input, not a prime number: 0")
      end
      it "returns error for [1]" do
        table = MultiplicationTable.new(1)
        expect{ table.generateTable() }.to raise_error("Invalid input, not a prime number: 1")
      end
      it "returns error for [1, 2]" do
        table = MultiplicationTable.new([1,2])
        expect{ table.generateTable() }.to raise_error("Invalid input, not a prime number: 1")
      end
      it "returns error for [2, 1]" do
        table = MultiplicationTable.new([2,1])
        expect{ table.generateTable() }.to raise_error("Invalid input, not a prime number: 1")
      end
      it "returns error for [-2]" do
        table = MultiplicationTable.new(-2)
        expect{ table.generateTable() }.to raise_error("Invalid input, not a prime number: -2")
      end
    end

    context "given valid input" do
      it "generates a valid table for single input as integer" do
        table = MultiplicationTable.new(2)
        expect(table.generateTable()).to eq("|    |  2 |\n|  2 |  4 |")
      end

      it "generates a valid table for single input as list" do
        table = MultiplicationTable.new([2])
        expect(table.generateTable()).to eq("|    |  2 |\n|  2 |  4 |")
      end

      it "generates a valid table for multiple input" do
        table = MultiplicationTable.new([2, 3, 5, 7])
        expect(table.generateTable()).to eq("|     |   2 |   3 |   5 |   7 |\n|   2 |   4 |   6 |  10 |  14 |\n|   3 |   6 |   9 |  15 |  21 |\n|   5 |  10 |  15 |  25 |  35 |\n|   7 |  14 |  21 |  35 |  49 |")
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