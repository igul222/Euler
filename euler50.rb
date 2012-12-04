require 'progress'
max_number_of_primes = 78497 + 100 # the 78498th prime is greater than 1 million
# max_number_of_primes = 1000
@max_prime_sum = 1_000_000
max_length = max_number_of_primes

def prime?(n)
  for i in (2..Math.sqrt(n).to_i)
    return false if n%i == 0
  end
  true
end

@primes = [2]
def nth_prime(n)
  @primes[n] ||= begin
    prime = nth_prime(n-1) + 1
    prime += 1 while !prime?(prime)
    prime
  end
end

def sum_of_primes(start, length)
  sum = 0
  for n in (start..start+length-1)
    sum += nth_prime(n)
  end
  return sum
end

@highest_prime = 5
@highest_set = {:start => 0, :length => 0}

def process_set(start,length)
  sum = sum_of_primes(start,length)
  return false if sum > @max_prime_sum
  return true if length < @highest_set[:length]
  return true if !is_prime(sum)
  @highest_prime = sum
  @highest_set = {:start => start, :length => length}
  true
end

Progress.start('',max_number_of_primes) do

for start in (0..max_number_of_primes)
  for length in (0..[max_number_of_primes-start,max_length].min)
    break unless process_set(start,length)
  end
  Progress.step 1
end

end

puts @highest_prime
puts @highest_set