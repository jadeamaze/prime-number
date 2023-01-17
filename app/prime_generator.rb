class PrimeGenerator
   # Returns the updated primes array. Return can be ignored and is only
   # included for testing purposes (currently).
   def loadPrimes()
      primeFile = File.open("resources/primes.data")
      @primes = primeFile.read
      primeFile.close

      return @primes
   end

   def generate(n)
      if (!(n.to_i.eql? n) || n < 2)
         raise "N must be an integer >= 2, but found #{n}"
      end
      primes = [2]  #first prime
      if (n > 2)
         for i in 2..n
            # if prime(i)
         end
      end
      return primes
   end
end