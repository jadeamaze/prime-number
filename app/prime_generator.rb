class PrimeGenerator
   @@PRIME = nil
   @@NOT_PRIME = 1

   # The prime number sieve works by way of elimination, which means that first, the pool must be defined and then numbers
   # are excluded from the pool. The pool or batch size will be calculated based on n that is input, up to this number,
   # max_batch_size. If the calculation of batch size based on n exceeds this number, the results will be paginated.
   # Pagination hasn't actually been done though ...
   @@max_batch_size = 1000

   # Returns the updated primes array. Return can be ignored and is only
   # included for testing purposes (currently).
   def loadPrimes()
      primeFile = File.open("resources/primes.data")
      @primes = primeFile.read
      primeFile.close

      return @primes
   end

   def generate(n)
      n = cleanInput(n)
      sieve_batch_size = getSieveBatchSize(n)

      # Initialize sieve. 2 is added by default.
      sieve = Array.new(sieve_batch_size)

      prime_list = [2]

      sieve_index = 3
      while prime_list.length < n
         # is true when index is a prime number.
         if (sieve[sieve_index] == @@PRIME)
            # the index is the number. If the index is a prime number, add it to the prime list.
            prime_list.append(sieve_index)
            filterMultiplesFromSieve(sieve_index, sieve)
         end

         sieve_index += 2
      end

      return prime_list
   end

   private

   def cleanInput(n)
      if (!(n.to_s.eql? n) || n.to_i < 2)
         raise "N must be an integer >= 2, but found #{n}"
      end
      return n.to_i
   end

   def getSieveBatchSize(n)
      best_estimate = n*n
      return best_estimate > @@max_batch_size ? @@max_batch_size : best_estimate
   end

   def filterMultiplesFromSieve(prime, sieve)
      i = prime*3
      while i < sieve.length
         sieve[i] = @@NOT_PRIME
         i += prime*2
      end
   end
end