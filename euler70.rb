UPPER_BOUND = 100
require 'progress'

@primes = []
def prime?(n)
  @primes[n] ||= begin
    for i in (2..Math.sqrt(n).to_i)
      return false if n%i == 0
    end
    true
  end
end

@phi_unmultiplied = [0, 1]
def phi(n)
  puts @phi_unmultiplied.inspect
  result = @phi_unmultiplied.last
  old_n = @phi_unmultiplied.count-1
  for p in ((old_n+1)..n)
    next unless n%p==0 && prime?(p) && p>1
    result *= (1-1.0/p)
  end

  @phi_unmultiplied[n] = result

  (result*n).round
end

def permutation?(a,b)
  a.to_s.chars.sort == b.to_s.chars.sort
end

100.times do |n|
  puts phi(n)
end

# min_n = 0
# min_ratio = 1.0/0.0
# UPPER_BOUND.times_with_progress('Euler 70') do |i|
#   i += 5
#   phi = phi(i)
#   puts phi
#   if permutation?(i,phi) && i.to_f/phi.to_f < min_ratio
#     min_ratio = i.to_f/phi.to_f
#     min_n = i
#     puts 'replacing'
#   end
# end

# puts min_n
# puts min_ratio