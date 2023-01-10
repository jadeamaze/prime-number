require_relative '../app/multiplication_table.rb'
require_relative '../app/prime_generator.rb'

describe MultiplicationTable do

	describe ".print output" do
    context "given invalid (zero) input" do
      it "returns error" do
        table = MultiplicationTable.new(1)
        expect(table.outputTable()).to eq(0)
      end
    end
  end
end

describe PrimeGenerator do
  describe ".print output" do
    context "given invalid (zero) input" do
      it "returns error" do
        primeGenerator = PrimeGenerator.new()
        primeGenerator.loadPrimes()
        expect(primeGenerator.testJade()).to eq(0)
      end
    end
  end
end