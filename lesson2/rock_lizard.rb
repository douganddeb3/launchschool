# rock_lizard.rb

VALID_CHOICES = %w(rock paper scissors lizard spock)
def win?(choice, computer_choice)
  (choice == 'rock' && (computer_choice == 'scissors' ||
    computer_choice == 'lizard')) ||
    (choice == 'scissors' && (computer_choice == 'paper' ||
    computer_choice == 'lizard')) ||
    (choice == 'paper' && (computer_choice == 'rock' ||
    computer_choice == 'spock')) ||
    (choice == 'lizard' && (computer_choice == 'paper' ||
    computer_choice == 'spock')) ||
    (choice == 'spock' && (computer_choice == 'rock' ||
      computer_choice == 'scissors'))
end

def declare_winner(arr_scores)
  if arr_scores[0] == 5
    prompt "You won the entire match! Game over"
    exit
  elsif arr_scores[1] == 5
    prompt "The computer won the entire match! Game over"
    exit
  end
end

def display_results(choice, computer_choice)
  if win?(choice, computer_choice)
    prompt "You win"
  elsif win?(computer_choice, choice)
    prompt "Computer won"
  else
    prompt "You tied"
  end
end

def keep_score(choice, computer_choice, arr_scores)
  if win?(choice, computer_choice)
    arr_scores[0] = arr_scores[0] + 1
  elsif win?(computer_choice, choice)
    arr_scores[1] = arr_scores[1] + 1
  else
    arr_scores[2] = arr_scores[2] + 1
  end
  arr_scores
end

def prompt(message)
  Kernel.puts("-> #{message}")
end

prompt "WELCOME TO ROCK, PAPER, SCISSORS, lIZARD, SPOCK"
arr_scores = [0, 0, 0]
choice = ""
loop do
  loop do
    prompt("Choose one. Enter the number for your choice")
    i = 1
    VALID_CHOICES.each do |list|
      prompt("#{i}) #{list}")
      i += 1
    end
    choice = Kernel.gets.chomp.to_i
    choice = VALID_CHOICES[choice - 1]
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end
  computer_choice = VALID_CHOICES.sample
  Kernel.puts("You choose #{choice}. Computer choose #{computer_choice}")
  display_results(choice, computer_choice)
  arr_scores = keep_score(choice, computer_choice, arr_scores)
  prompt arr_scores.to_s
  declare_winner(arr_scores)
  prompt("Do you want to play again? y or n")
  play_again = Kernel.gets.chomp.downcase.start_with?('y')
  break unless play_again
end
