require_relative 'multiplication_table.rb'
require_relative 'prime_generator.rb'

def runApp(n)
    primes_list = PrimeGenerator.new.generate(n)
    return MultiplicationTable.new(primes_list).generateTable()
end

ARGV.each do|a|
    if (a.to_i > 0)
        puts runApp(a)
    end
end