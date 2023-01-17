require_relative '../app/multiplication_table.rb'
require_relative '../app/prime_generator.rb'
require_relative '../app/main.rb'

describe MultiplicationTable do
	describe ".generate table" do
    context "given input" do
      it "generates a valid table for single input as integer" do
        table = MultiplicationTable.new(0)
        expect(table.generateTable()).to eq("|    |  0 |\n|  0 |  0 |")
      end
      it "generates a valid table for single input as integer" do
        table = MultiplicationTable.new(1)
        expect(table.generateTable()).to eq("|    |  1 |\n|  1 |  1 |")
      end
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

      it "generates a valid table for single input as list" do
        table = MultiplicationTable.new([2.5, -1, 2, 4])
        expect(table.generateTable()).to eq("|     |  -1 |   2 | 2.5 |   4 |\n" +
          "|  -1 |   1 |  -2 |-2.5 |  -4 |\n" +
          "|   2 |  -2 |   4 | 5.0 |   8 |\n" +
          "| 2.5 |-2.5 | 5.0 |6.25 |10.0 |\n" +
          "|   4 |  -4 |   8 |10.0 |  16 |")
      end
    end
  end
end

describe PrimeGenerator do
  describe ".throw error on invalid input" do
    context "given invalid input" do
      primeGenerator = PrimeGenerator.new()
      it "returns error for 1" do
        expect { primeGenerator.generate(1.1) } .to raise_error("N must be an integer but found 1.1")
      end
      it "returns error for 0" do
        expect { primeGenerator.generate(0) } .to raise_error("N must be >= 1 but found 0")
      end
      it "returns error for 2.5" do
        expect { primeGenerator.generate(2.5) } .to raise_error("N must be an integer but found 2.5")
      end
      it "returns error for -1" do
        expect { primeGenerator.generate(-1) } .to raise_error("N must be >= 1 but found -1")
      end
      it "returns error for -5" do
        expect { primeGenerator.generate(-5) } .to raise_error("N must be >= 1 but found -5")
      end
    end
  end
  describe ".generate sequence" do
    primeGenerator = PrimeGenerator.new()
    context "given input of 2" do
      it "returns [2, 3]" do
        expect(primeGenerator.generate(2)).to eq([2, 3])
      end
    end
    context "given input of 3" do
      it "returns [2, 3, 5]" do
        expect(primeGenerator.generate(3)).to eq([2, 3, 5])
      end
    end
    context "given input of 10" do
      it "returns [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]" do
        expect(primeGenerator.generate(10)).to eq([2, 3, 5, 7, 11, 13, 17, 19, 23, 29])
      end
    end
    context "given input of 100" do
      it "returns [2, 3, 5, 7, 11, 13, ... 541]" do
        expect(primeGenerator.generate(100)).to eq([2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71,
          73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173,
          179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281,
          283, 293, 307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409,
          419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499, 503, 509, 521, 523, 541])
      end
    end
  end
end

describe "Main" do
  describe ".generates prime multiplication table" do
    context "given invalid input" do
      it "returns error for 1" do
        expect { runApp(1.1) } .to raise_error("N must be an integer but found 1.1")
      end
      it "returns error for 0" do
        expect { runApp(0) } .to raise_error("N must be >= 1 but found 0")
      end
      it "returns error for 2.5" do
        expect { runApp(2.5) } .to raise_error("N must be an integer but found 2.5")
      end
      it "returns error for -1" do
        expect { runApp(-1) } .to raise_error("N must be >= 1 but found -1")
      end
      it "returns error for -5" do
        expect { runApp(-5) } .to raise_error("N must be >= 1 but found -5")
      end
    end
  end

  describe ".prints table for valid input" do
    context "given 2" do
      it "prints .." do
        expect(runApp(2)).to eq("|    |  2 |  3 |\n|  2 |  4 |  6 |\n|  3 |  6 |  9 |")
      end
    end
    context "given 5" do
      it "prints .." do
        expect(runApp(5)).to eq("|      |    2 |    3 |    5 |    7 |   11 |\n" +
          "|    2 |    4 |    6 |   10 |   14 |   22 |\n" +
          "|    3 |    6 |    9 |   15 |   21 |   33 |\n" +
          "|    5 |   10 |   15 |   25 |   35 |   55 |\n" +
          "|    7 |   14 |   21 |   35 |   49 |   77 |\n" +
          "|   11 |   22 |   33 |   55 |   77 |  121 |")
      end
    end
    context "given 10" do
      it "prints .." do
        expect(runApp(10)).to eq("|      |    2 |    3 |    5 |    7 |   11 |   13 |   17 |   19 |   23 |   29 |\n" +
          "|    2 |    4 |    6 |   10 |   14 |   22 |   26 |   34 |   38 |   46 |   58 |\n" +
          "|    3 |    6 |    9 |   15 |   21 |   33 |   39 |   51 |   57 |   69 |   87 |\n" +
          "|    5 |   10 |   15 |   25 |   35 |   55 |   65 |   85 |   95 |  115 |  145 |\n" +
          "|    7 |   14 |   21 |   35 |   49 |   77 |   91 |  119 |  133 |  161 |  203 |\n" +
          "|   11 |   22 |   33 |   55 |   77 |  121 |  143 |  187 |  209 |  253 |  319 |\n" +
          "|   13 |   26 |   39 |   65 |   91 |  143 |  169 |  221 |  247 |  299 |  377 |\n" +
          "|   17 |   34 |   51 |   85 |  119 |  187 |  221 |  289 |  323 |  391 |  493 |\n" +
          "|   19 |   38 |   57 |   95 |  133 |  209 |  247 |  323 |  361 |  437 |  551 |\n" +
          "|   23 |   46 |   69 |  115 |  161 |  253 |  299 |  391 |  437 |  529 |  667 |\n" +
          "|   29 |   58 |   87 |  145 |  203 |  319 |  377 |  493 |  551 |  667 |  841 |")
      end
    end
  end
end
