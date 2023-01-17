class MultiplicationTable
   def initialize(table_numbers)
      # Cannot remove sort from this line without updating invalid input checker in #generateTable.
      @numbers = [*table_numbers].sort
   end

   def generateTable()
      return buildTableString()
   end

   private

   def buildTableString()
      @cell_size = cellSize()
      # Adds the first row, which is the list of prime numbers passed in to initialize the table.
      table = "|" + " "* @cell_size + "|#{@numbers.map { |n| printNumberWithWhitespace(n)}.join("|")}|"

      for first_row in @numbers do
         # add new row to multiplication table
         table += "\n|#{printNumberWithWhitespace(first_row)}|"
         index = 0
         while index < @numbers.length 
            # add new column/cell
            cell_value = first_row * @numbers[index]
            table += "#{printNumberWithWhitespace(cell_value)}|"
            index = index + 1
         end
      end

      return table
   end

   def numberCharLength(num)
      return num.to_s.length
   end

   def cellSize()
      largest_int = (@numbers.last)**2
      num_digits_in_largest_int = numberCharLength(largest_int)
      return num_digits_in_largest_int + 3 #whitespace on either side, 2 in front, one behind
   end

   def printNumberWithWhitespace(number)
      if(!defined?(@cell_size))
         raise "Cannot generate number to print before cell_size is defined."
      end

      digits_in_number = numberCharLength(number)
      append_whitespace = @cell_size - digits_in_number - 1
      return " " * append_whitespace + "#{number}" + " "
   end
end

