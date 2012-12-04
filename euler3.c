#include <stdio.h>
#include <math.h>

#define NUMBER 600851475143

int prime(long n) {
  long max_factor = (long)sqrt(n);
  for(int i=2;i<=max_factor;i++) {
    if(n % i == 0)
      return 0;
  }
  return 1;
}

int main() {
  for(long i=NUMBER;i>0;i-=2) {
    if(NUMBER % i == 0 && prime(i))
      printf("%li\n", i);
    if(i%10000000 == 1)
      printf("%f\n", ((float)i)/NUMBER);
  }
}