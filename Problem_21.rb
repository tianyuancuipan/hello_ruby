# Evaluate the sum of all the amicable numbers under 10000.


# Solution #1
require 'prime'
divisors = {}
(2..9999).each do |num|
  divisors_sum = 0 - num
  primes, powers = num.prime_division.transpose
  powers = powers.map { |power| (0..power).to_a }
  power_combinations = powers.shift.product(*powers)
  power_combinations.each do |combo|
    divisors_sum += primes.zip(combo).map { |x| x[0]**x[1] }.reduce(:*)
  end
  if divisors_sum < 10000
    divisors[num] = divisors_sum
  end
end

amicables_sum = 0
divisors.default = 0
while divisors.length >= 2
  a = divisors.shift
  if divisors[a[1]] == a[0]
    amicables_sum += (a[0] + a[1])
    divisors.delete(a[1])
  end
end

puts amicables_sum

=begin
# Solution #2
class Integer
  def divisors_sum
    sum = 1

    (2..Math.sqrt(self)).each do |i|
      sum += i + (self / i) if self % i == 0
    end
    sum
  end
end

sum = 0

(2..9999).each do |n|
  s = n.divisors_sum
  if s != n && s.divisors_sum == n
    sum += n
  end
end

puts sum
=end
