#calc_simple.rb
#ask for 2 numbers
#ask user for an operation
#perform operation

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  puts ("-> #{message}")
end 

def valid_number?(num)
  num.to_i != 0 
end  

prompt (MESSAGES['welcome'])
name = ""
loop do
  name  = gets.chomp
  if name.empty?
    prompt("Please type a name")
  else
    break
  end 
end  

prompt("Hello, #{name}")
loop do
  num1 = ""
  loop do
    prompt ("What is the first number?")
    num1 = Kernel.gets().chomp()
    
    if valid_number?(num1)
      break
    else  
      prompt("hmmm, need a valid number, try again")
    end 
  end  
  
  num2 = ""
  loop do
  prompt ("What is the second number?")
  num2 = Kernel.gets().chomp()
    if valid_number?(num2)
      break
    else  
      prompt("hmmm, need a valid number, try again")
    end 
  end

operator = ""  
operator_prompt = <<-MSG
  What operation?
  1) add
  2) subtract
  3) multiply
  4) divide
MSG
loop do
  prompt(operator_prompt)
  operator = Kernel.gets().chomp()
  if %w(1 2 3 4).include?(operator)
    break
  else
    prompt("Must choose 1, 2, 3, or 4")
  end
end  
    
    case operator
    when '1'
    prompt("Adding #{num1} and #{num2}")  
    answer =  num1.to_i + num2.to_i
    when '2'
    prompt("Subtracting #{num2} from #{num1}")   
    answer =  num1.to_i - num2.to_i
    when '3'
    prompt("Muliplying #{num1} and #{num2}")   
    answer =  num1.to_i * num2.to_i
    when '4'
    prompt("Dividing #{num1} by #{num2}")   
    answer = num1.to_f / num2.to_f
  end
  prompt answer
  prompt ("Do you want to perform another operation? y or n")
  again = gets.chomp
  break unless again.downcase.start_with?('y')
end

  prompt("Thank you for playing")


