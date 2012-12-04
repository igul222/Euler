@fibs = [1,1]
def fib(n)
  @fibs[n] ||= @fibs[n-1] + @fibs[n-2]
end

sum = 0
n = 0

while fib(n) < 4_000_000
  sum += fib(n) if fib(n)%2==0
  n+=1
end

puts sum