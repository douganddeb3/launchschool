# rock_p_s.rb
VALID_CHOICES = %w(rock paper scissors)
def win?(choice, computer_choice)
  (choice == 'rock' && computer_choice == 'scissors') ||
    (choice == 'scissors' && computer_choice == 'paper') ||
    (choice == 'paper' && computer_choice == 'rock')
end

def display_results(choice, computer_choice)
  if win?(choice, computer_choice)
    puts "You win"
  elsif win?(computer_choice, choice)
    puts "Computer won"
  else
    puts "You tied"
  end
end

def prompt(message)
  Kernel.puts("-> #{message}")
end

choice = ""
loop do
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets.chomp
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end
  computer_choice = VALID_CHOICES.sample
  Kernel.puts("You choose #{choice}. Computer choose #{computer_choice}")
  display_results(choice, computer_choice)
  prompt("Do you want to play again? y or n")
  play_again = Kernel.gets.chomp.downcase.start_with?('y')
  break unless play_again
end
