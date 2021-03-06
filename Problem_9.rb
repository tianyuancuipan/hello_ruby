# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product of abc.

for a in (1..332)
  for b in (a..500)
    for c in (b..500)
      if a**2 + b**2 == c**2 and a+b+c == 1000
        puts a*b*c
      end
    end
  end
end
