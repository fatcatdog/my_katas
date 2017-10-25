# Fluent Calculator
# Ruby:

class Calc
  attr_accessor :result, :last_operator

  def initialize(result=0)
   @result = result
  end

  OPERATORS = {
    :plus => :+, :minus => :-, :times => :*, :divided_by => :/
  }

  OPERANDS = [ :zero, :one, :two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :eleven, :twelve ]

  def method_missing(m, *args, &block)
    if OPERATORS.include?(m.to_sym)
      @last_operator = m.to_sym
      return self
    elsif OPERANDS.include?(m.to_sym)
      if @last_operator.nil?
        @result = OPERANDS.index(m.to_sym)
        return self
      end
      @result = eval("#{@result} #{OPERATORS[@last_operator]} #{OPERANDS.index(m.to_sym)}")
      return @last_operator.nil? ? self : @result
    end

    super
  end
end
#
# IPv4 to int32
# Ruby:

def ip_to_int32(ip)
 ip = ip.split('.')
  result = 0
  ip.reverse.each_with_index do |i, index|
    result += i.to_i*2**(8*(index))
  end
  return result
end
#
# If you can read this...
# Ruby:

def to_nato(words)
newarray = []
nato = {"a" => "Alfa", "b" => "Bravo", "!" => "!", "." => ".", "?" => "?",  "c" => "Charlie", "d" => "Delta", "e" => "Echo", "f" => "Foxtrot", "g" => "Golf", "h" => "Hotel", "i" => "India", "j" => "Juliett", "k" => "Kilo", "l" => "Lima", "m" => "Mike", "n" => "November", "o" => "Oscar", "p" => "Papa", "q" => "Quebec", "r" => "Romeo", "s" => "Sierra", "t" => "Tango", "u" => "Uniform", "v" => "Victor", "w" => "Whiskey", "x" => "Xray", "y" => "Yankee", "z" => "Zulu"}
letters = words.downcase.split(" ").join("").chars
letters.each do |x|
newarray << nato[x]
end
newarray.join(" ")

end

#
# What's a Perfect Power anyway?
# Ruby:

def isPP(n)
	    (2..n).each do |i|
	    	(2..n).each do |j|
	    		return [i,j] if i**j==n
	    		break if i**j > n
	    	end
	    	return nil if i**2 > n
	    end
end

#
# Rainfall
# Ruby:

def mean(town, strng)
  cities = strng.scan(/.+(?=:)/)
  return -1 if cities.include?(town) == false
  rainfall = []
  strng.each_line{|w| rainfall << w.scan(/\d*[.]\d*/).map{|x|x.to_f}}
  return rainfall[cities.index(town)].inject(:+) / rainfall[cities.index(town)].length
end

def variance(town, strng)
  cities = strng.scan(/.+(?=:)/)
  return -1 if cities.include?(town) == false
  rainfall = []
  strng.each_line{|w| rainfall << w.scan(/\d*[.]\d*/).map{|x|x.to_f}}
  meanie = mean(town,strng)
  variance = rainfall[cities.index(town)].map{|x| (x - meanie)**2}
  variance.inject(:+) / variance.length
end
#
# Convert an array of strings to array of numbers
# Ruby:

def to_number_array(string_array)
string_array.map(&:to_f)
end
#
# Especially Joyful Numbers
# Ruby:

def number_joy(n)
a = n.to_s.chars.map(&:to_i).reduce(:+)
b = a.to_s.reverse.to_i
(a * b) == n
end
#
# Two to One
# Ruby:

def longest(a1, a2)
a1arr = a1.split("").uniq
a2arr = a2.split("").uniq
a3 = (a1arr + a2arr).sort.uniq.join
a3

end
#
# Don't give me five!
# Ruby:

def dont_give_me_five(start_,end_)
  (start_..end_).count { |n| n.to_s !~ /5/ }
end
#
# Friend or Foe?
# Ruby:

def friend(friends)
arr = []
friends.each {|x| arr << x if x.length == 4}
arr
end
#
# Delete occurrences of an element if it occurs more than n times
# Ruby:

def delete_nth(order,max_e)
  arr=[]
  order.each{|ele| arr << ele if arr.count(ele) < max_e}
  arr
end
#
# Binary Addition
# Ruby:

def add_binary(a,b)
return (a + b).to_s(2)
end

#
# Bouncing Balls
# Ruby:

def bouncingBall(h, bounce, window)
  return -1 if 1 <= bounce || bounce <= 0 || window > h
  count = -1
    while h > window
      count += 2
      h *= bounce
    end
  count
end
#
# Which are in?
# Ruby:

def in_array(array1, array2)
  array1.select{|s| array2.any?{|w| w.include?(s) } }.sort
end
#
# Format a string of names like 'Bart, Lisa & Maggie'.
# Ruby:

def list names
case names.size
  when 0
    ""
  when 1
    names[0][:name]
  when 2
    "#{names[0][:name]} & #{names[1][:name]}"
  else
    "#{names[0..names.size-2].map { |x| x[:name] }.join(", ")} & #{names[names.size-1][:name]}"
  end
end

def list names
  names = names.map{|x| x[:name]}
  return names.first.to_s if names.length < 2
  return names.first + " & " + names[1] if names.length == 2

  last = names.pop
  names.join(", ") + " & #{last}"
end
#
#
# Find the next perfect square!
# Ruby:

def find_next_square(sq)
 if (Math.sqrt(sq)) % 1 != 0
 -1
 else
 a = Math.sqrt(sq)
 (a + 1)*(a + 1)
end
end
#
#
# The Supermarket Queue
# Ruby:

def queue_time(customers, n)
  arr = Array.new(n, 0)
  customers.each { |customer| arr[arr.index(arr.min)] += customer }
  arr.max
end


def queue_time(customers, n)
  return 0 if customers.empty?
  customers.reject!(&:zero?)
  return customers.inject(:+) if n == 1
  tills = Array.new(n, 0)

  (0..(customers.length - 1)).each do |i|

    tills[tills.index(tills.min)] += customers[i]
  end

  tills.max
end

#
# Find the divisors!
# Ruby:

def divisors(n)
if   (2..Math.sqrt(n)).none? {|f| n % f == 0}
"#{n} is prime"
else
array = (1..n).select { |x|n % x == 0}
array - [n] - [1]
end
end
 # "#{n} is prime"
#
#
#  Fold an array
# Ruby:

def fold_array(array, runs)
  newArray = array[0..array.length]
  runs.times do
    for i in 0...newArray.length/2
      newArray[i] = newArray[i] + newArray.pop
    end
  end
  newArray
end

#
# Disemvowel Trolls
# Ruby:

def disemvowel(str)
  str.tr('aeiouAEIOU', "")
end
#
#
#
# Sum of Digits / Digital Root
# Ruby:

def digital_root(n)
  return n < 1 ? 0 : (n - 1) % 9 + 1
end

def digital_root(n)
 string=n.to_s
  while string.length > 1 do
    result = string.chars.map(&:to_i).inject(&:+)
    string = result.to_s
  end
 return string.to_i
end
#
#
# Array.diff
# Ruby:

def array_diff(a, b)
a-b
end

#
#
# Find the missing letter
# Ruby:


def find_missing_letter(arr)
((arr.first..arr.last).to_a - arr).first
end
#
#
# Who likes it?
# Ruby:

def likes(names)
  case names.size
  when 0
    "no one likes this"
  when 1
    "#{names[0]} likes this"
  when 2
    "#{names[0]} and #{names[1]} like this"
  when 3
    "#{names[0]}, #{names[1]} and #{names[2]} like this"
  else
    "#{names[0]}, #{names[1]} and #{names.size - 2} others like this"
  end
end


#
# Sum of the first nth term of Series
# Ruby:

def series_sum(n)
  return "0.00" if n == 0
  '%.2f' % (0..n-1).map { | x | (1.0/(x*3+1))}.reduce(:+)
end

#
#
# Take a Ten Minute Walk
# Ruby:


def isValidWalk(walk)
  walk.count('w') == walk.count('e') and
  walk.count('n') == walk.count('s') and
  walk.count == 10
end


#
# Exes and Ohs
# Ruby:

def XO(str)
  str.downcase.count('x') == str.downcase.count('o')

end

#
#
#
# Complementary DNA
# Ruby:

def DNA_strand(dna)
dna.tr('ATGC', 'TACG')
end

#
#
# Jaden Casing Strings
# Ruby:

class String
  def toJadenCase
    self.split.map(&:capitalize).join(' ')
  end
end



#
# Printer Errors
# Ruby:

def printer_error(s)
"#{s.count('n-z')}/#{s.length}"
end


#
# Mumbling
# Ruby:

def accum(s)
  s.chars.each_with_index.map{ |c, i| c.upcase + c.downcase * i }.join('-')
end
#
# Isograms
# Ruby:


 def is_isogram(string)
  string.downcase.chars.uniq == string.downcase.chars
 end

 def is_isogram(string)
string.downcase!
  ('a'..'z').each do |letter|
    return false if string.count(letter) > 1
  end
  return true
end


#
# Remove the minimum
# Ruby:

def remove_smallest(numbers)
 return numbers if numbers.empty?
  numbers.delete_at(numbers.index(numbers.min))
  numbers
end


#
# Money, Money, Money
# Ruby:

def calculate_years(principal, interest, tax, desired)
# principal amount
  year = 0
  while principal < desired
    year += 1
    income = principal * interest
    principal += income - income * tax
  end
  year
end

#
#
# Beginner Series #3 Sum of Numbers
# Ruby:

def get_sum(a,b)
  c, d = [a, b].sort
  (c..d).inject(:+)
end


#
# Highest and Lowest
# JavaScript:

function highAndLow(numbers){
   numbers = numbers.split(" ");
  return Math.max.apply(null, numbers) + " " +  Math.min.apply(null, numbers)
}

#
# Multiply
# JavaScript:

function multiply(a, b){
  return a * b
}


# Resistor Color Codes
# Ruby

def decode_resistor_colors(bands)
  Decoder.new(bands.split).call
end

class Decoder

  CODE_MAP = {
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    gray: 8,
    white: 9
  }

  TOLERANCE = {
    gold: '5%',
    silver: '10%'
  }

  def initialize(bands)
    @digit_bands = bands[0..1]
    @power_band = bands[2]
    @tolerance_band = bands[3] if bands[3]
  end

  def call
    "#{processed_number(calculate_number)} ohms, #{get_tolerance}"
  end

  private

  def get_number
    @digit_bands.map(&:to_sym).map do |color|
      CODE_MAP.values_at(color)
    end.join.to_i
  end

  def get_power
    CODE_MAP.select { |k, v| @power_band.include?(k.to_s) }.values.join.to_i
  end

  def get_tolerance
    @tolerance_band ? TOLERANCE.values_at(@tolerance_band.to_sym).join : '20%'
  end

  def calculate_number
    get_number * (10**(get_power))
  end

  def processed_number(number)
    if number >= 1000000
      (number % 1000000).zero? ? "#{number / 1000000}M" : "#{number.to_f / 1000000}M"
    elsif number >= 1000
      (number % 1000).zero? ? "#{number / 1000}k" : "#{number.to_f / 1000}k"
    else
      number
    end
  end

end

# Resistor Color Codes, Part 2
# ruby 

def encode_resistor_colors(ohms_string)
  value = ohms_string.split(' ').first
  if value[-1] == 'M'
    value = value.chop.to_f * 1000000
  elsif value[-1] == 'k'
    value = value.chop.to_f * 1000
  else
    value = value.to_f
  end
  value = value.to_i

  colors = "black brown red orange yellow green blue violet gray white".split(' ')

  bands = []
  bands[0] = colors[value.to_s[0].to_i]
  bands[1] = colors[value.to_s[1].to_i]
  bands[2] = colors[value.to_s.length - 2]
  bands[3] = "gold"

  return bands.join(' ')
end

encode_resistor_colors("1k ohms")

# Bits Battle
# Ruby

def bitsBattle(numbers)
evens = numbers.select {|x| x % 2 == 0 && x > 0 } 
odds = numbers.select {|x| x % 2 != 0 } 

ones_odds = 0 
zeros_evens = 0 

evens.each do |convert_and_count| 
zeros_evens += convert_and_count.to_s(2).scan(/0/).count
end 

odds.each do |convert_and_count| 
ones_odds += convert_and_count.to_s(2).scan(/1/).count
end 

if zeros_evens > ones_odds
return "evens win"
elsif zeros_evens < ones_odds
return "odds win"
else 
return "tie"
end 

end

# World Bits War
# Ruby

def bits_war(numbers)
evens = numbers.select {|x| x % 2 == 0 && x > 0 } 
odds = numbers.select {|x| x % 2 != 0 && x > 0 } 
neg_evens = numbers.select {|x| x % 2 == 0 && x < 0 } 
neg_odds =  numbers.select {|x| x % 2 != 0 && x < 0 } 

ones_odds = 0 
ones_evens = 0 

evens.each do |convert_and_count| 
ones_evens += convert_and_count.to_s(2).scan(/1/).count
end 

neg_evens.each do |convert_and_count| 
ones_evens -= convert_and_count.to_s(2).scan(/1/).count
end 

odds.each do |convert_and_count| 
ones_odds += convert_and_count.to_s(2).scan(/1/).count
end 

neg_odds.each do |convert_and_count| 
ones_odds -= convert_and_count.to_s(2).scan(/1/).count
end 

if ones_evens > ones_odds
return "evens win"
elsif ones_evens < ones_odds
return "odds win"
else 
return "tie"
end 

end
