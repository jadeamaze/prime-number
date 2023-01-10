class PrimeGenerator
   def loadPrimes()
      primeFile = File.open("resources/primes.data")
      @primes = primeFile.read
      primeFile.close
   end

   def testJade()
      return @primes
   end

   def generate(n, primes)
      n = floor(n)
      primes = 2  #first prime

      for i in 2..n
         # if prime(i)
      end
   end
end