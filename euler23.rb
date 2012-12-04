require 'progress'

def proper_divisors(n)
  factors = []
  for factor in (1..Math.sqrt(n).to_i)
    if n%factor==0
      factors << factor
      factors << n/factor
    end
  end
  factors.uniq-[n]
end

def abundant?(n)
  (proper_divisors(n).inject(:+)||0) > n
end

abundants = []
for n in (1..28123)
  abundants << n if abundant?(n)
  Progress.step
end

sums = abundants.map {|x| abundants.map{|y| x+y}}.flatten.uniq

sum = 0
for n in (0..28123)
  sum += n unless sums.include?(n)
end

puts sum

puts sums.count