n = 20
n += 20 until [11,12,13,14,15,16,17,18,19,20].inject(true) { |mem, var| mem &= n%var==0; mem }

puts n