#mort_calc.rb

def prompt(message)
  puts ("-> #{message}")
end 

def valid_num?(num)
  num.to_i.to_s == num
end

prompt("Welcome to the Mortgage Payment Calculator")

loan = ""
loop do
  prompt("What is the loan amount?")
  loan = gets.chomp
  if valid_num?(loan)
    loan = loan.to_f
    break
  end
end

apr = ""
loop do
  prompt("What is the APR?")
  apr = gets.chomp
  if valid_num?(apr)
    apr = apr.to_f
    break
  end
end

y_dur = ""
loop do
  prompt("What is the loan duration in years?")
  y_dur = gets.chomp
  if valid_num?(y_dur)
    y_dur = y_dur.to_f
    break
  end
end

mir = 0.0
mir = apr/1200
llm = y_dur*12
mp = loan*(mir*(1 + mir)**llm)/((1 + mir)**llm - 1)

puts ("Monthly payment is #{mp}")




  
