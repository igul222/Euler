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

puts nth_prime(10000)