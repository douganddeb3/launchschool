# exer1.rb
# some exercises

arr = ["laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear"]


arr.each do |i|
  if i.downcase.include?("lab")
    puts ("#{i}")
  end    
end  

arr1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
odds = arr1.select {|i| i%2 == 1}
puts odds

arr1 << 11
print arr1
puts""
arr1.unshift(0)
print arr1
puts ""

arr1.pop
print arr1
puts""
arr1.push(3)
print arr1
puts ""

arr1.uniq!
print arr1
puts""

hash1 = {a: 1, b: 2, c: 3, d: 4}
puts hash1
hash2 = {"stuff" => 'st', "things" => 'th', "others" => 'ot'
  
}
puts hash2["things"]

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

h = {email: "", address: "", phone: ""}

h[:email] = contact_data[0][0]

puts h
contacts["Joe Smith"] = h
puts contacts




contacts.each_key do |key|
  h[:email] = contact_data[0][0]
  h[:address] = contact_data[0][1]
  h[:phone] = contact_data[0][2]
  contacts[key] = h
end

puts contacts