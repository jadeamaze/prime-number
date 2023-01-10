class MultiplicationTable
   def initialize(numbers)
      @numbers = numbers
   end

   def outputTable()
      if(@numbers < 1)
         throw Error("Invalid input: #{@numbers}")
      end
   end
end

