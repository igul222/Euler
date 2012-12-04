# warning: unfinished

number = 600851475143

def prime?(n)
  for i in (2..Math.sqrt(n).to_i)
    return false if n%i == 0
  end
  true
end

number.downto(1) do |n|
  if number%n==0 && prime?(n)
    puts n
  end
end