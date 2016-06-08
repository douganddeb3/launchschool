def prefix(str)
  str + Time.now.to_s
  puts "Mr. " + str
end

name = "Joe"
prefix(name)
puts name
puts prefix(name)
puts name

arr = [1, 3, 4, 5, 7, 8, 6, 56, 3, 96]
puts arr.select {|x| x%2 == 0}