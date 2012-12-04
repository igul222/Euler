def palindrome?(n)
  n.to_s == n.to_s.reverse
end

largest_palindrome = 9009
for i in (100..999)
  for j in (100..999)
    largest_palindrome = i*j if palindrome?(i*j) && i*j > largest_palindrome
  end
end

puts largest_palindrome