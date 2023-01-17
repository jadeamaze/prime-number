class MultiplicationTable
   def initialize(table_numbers)
      # Cannot remove sort from this line without updating invalid input checker in #generateTable.
      @numbers = [*table_numbers].sort
   end

   def generateTable()
      checkInput()
      return buildTableString()
   end

   private

   def checkInput()
      # Relies on sort when assigning to instance variable.
      if(@numbers[0] < 2)
         raise "Invalid input, not a prime number: #{@numbers[0]}"
      end
   end

   def buildTableString()
      @cell_size = cellSize()
      # Adds the first row, which is the list of prime numbers passed in to initialize the table.
      table = "|" + " "* @cell_size + "|#{@numbers.map { |n| printNumberWithWhitespace(n)}.join("|")}|"

      for row_prime in @numbers do
         # add new row to multiplication table
         table += "\n|#{printNumberWithWhitespace(row_prime)}|"
         prime_index = 0
         while prime_index < @numbers.length 
            # add new column/cell
            cell_value = row_prime * @numbers[prime_index]
            table += "#{printNumberWithWhitespace(cell_value)}|"
            prime_index = prime_index + 1
         end
      end

      return table
   end

   def digitsInNumber(num)
      if (num <1)
         raise "Invalid number to calculate digits: #{num}. Number must be >1"
      end
      return Math.log10(num).floor() + 1
   end

   def cellSize()
      largest_int = (@numbers.last)**2
      num_digits_in_largest_int = digitsInNumber(largest_int)
      return num_digits_in_largest_int + 3 #whitespace on either side, 2 in front, one behind
   end

   def printNumberWithWhitespace(number)
      if(!defined?(@cell_size))
         raise "Cannot generate number to print before cell_size is defined."
      end

      digits_in_number = digitsInNumber(number)
      append_whitespace = @cell_size - digits_in_number - 1
      return " " * append_whitespace + "#{number}" + " "
   end
end

