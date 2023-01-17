class MultiplicationTable
   def initialize(table_numbers)
      @numbers = [*table_numbers].sort
   end

   def outputTable()
      # Relies on sort when assigning to instance variable.
      if(@numbers[0] < 2)
         raise "Invalid input, not a prime number: #{@numbers[0]}"
      end
   end
end

