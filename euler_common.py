from math import sqrt

def is_prime(n):
    if n < 2:     return False
    if n == 2:    return True
    if n%2 == 0:  return False
    for i in range(3,int(sqrt(n))+1, 2):
        if n%i == 0:
            return False
    return True


# should give the same result as is_prime(n), provided you call it with every number between 2 and n (in ascending order) first.
_primes = [2]
def sequential_is_prime(n):
  if n < 2: return False
  if n == 2: return True
  for prime in _primes:
    if n%prime == 0: return False
  _primes.append(n)
  return True

def nth_prime(n):
  i = _primes[-1] + 1
  while len(_primes) <= n:
    sequential_is_prime(i)
    i += 1
  return _primes[n]