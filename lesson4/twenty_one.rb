# twenty_one.rb

CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace'].freeze
SUITS = ["Clubs", "Diamonds", "Hearts", "Spades"].freeze
DECK = { "Clubs" => CARDS, "Diamonds" => CARDS, "Hearts" => CARDS, "Spades" => CARDS }
DECK_SIZE = 52
NUM_PLAYERS = 2
PLAY_UP_TO = 21
COMP_HITS_UP_TO = 17

def prompt(msg)
  puts msg
end

# shuffle just the card numbers, pair each suit with a card,
# add arrays of [suit, card#] to suit_and_card nested array
# [[suit, card#], [suit, card#]...]
def shuffle_deck(deck)
  deck.each_key do |key| # get each suit shuffled
    deck[key] = CARDS.shuffle
  end
  suit_and_card = []
  card = []
  deck.each_key do |key|
    card = deck[key]
    (0..12).each do |i|
      suit_and_card.push([key, card[i]]) # pair suit with card
    end
  end
  suit_and_card.shuffle! # then shuffle the whole nested array
end

def face_card_int(crd_value)
  case crd_value
  when 'Jack'
    return 10
  when 'Queen'
    return 10
  when 'King'
    return 10
  when 'Ace'
    return 1
  end
  crd_value
end

def display_both_hands(player_hand, computer_hand, before_dealer_shows)
  # system 'clear'
  prompt "Your cards are: "
  player_hand.each do |card|
    print "#{card[1]} of #{card[0]} "
  end
  puts ""
  prompt "The computer has: "
  if before_dealer_shows == 2
    print "#{computer_hand[0][1]} of #{computer_hand[0][0]} and [?]"
  else
    computer_hand.each do |card|
      print "#{card[1]} of #{card[0]} "
    end
  end
  puts ""
end

def deal_card!(dck, hand)
  hand.push(dck.pop)
end

def count_hand(hand)
  sum = 0
  has_ace = false
  hand.each do |card|
    sum += face_card_int(card[1])
    if card[1] == 'Ace'
      has_ace = true
    end
  end
  if has_ace && (sum + 10 <= PLAY_UP_TO)
    return sum + 10
  else
    sum
  end
end

def new_hand(dck, play1, play2)
  2.times do
    deal_card!(dck, play1)
    deal_card!(dck, play2)
  end
end

def hit_or_stay(dck, hand, hand2, before_dealer_shows)
  loop do
    prompt "Do you want to hit(press 1) or stay(press 2)"
    ans = gets.chomp.to_i
    case ans
    when 1
      hand = deal_card!(dck, hand)
      display_both_hands(hand, hand2, before_dealer_shows)
      if count_hand(hand) > 21
        return hand
      end
    when 2
      return hand
    else
      hit_or_stay(dck, hand, hand2, before_dealer_shows)
    end
  end
end

def computer_hit(dck, hand)
  comp_score = count_hand(hand)
  while comp_score < COMP_HITS_UP_TO
    hand.push(dck.pop)
    comp_score = count_hand(hand)
  end
end

def declare_winner(player_hand, computer_hand)
  comp_count = count_hand(computer_hand)
  play_count = count_hand(player_hand)
  if play_count > PLAY_UP_TO
    "Dealer"
  elsif comp_count > PLAY_UP_TO || comp_count < play_count
    "Player"
  elsif comp_count > play_count
    "Dealer"
  else
    "Tie"
  end
end

def play_again?
  puts "-------------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def decide_what_computer_does(new_deck, player_hand, computer_hand)
  if count_hand(player_hand) > PLAY_UP_TO
    before_dealer_shows = 1
    display_both_hands(player_hand, computer_hand, before_dealer_shows)
    prompt "BUSTED"
  else
    computer_hit(new_deck, computer_hand)
    before_dealer_shows = 1
    display_both_hands(player_hand, computer_hand, before_dealer_shows)
  end
end

def keep_score(who_won, win_lose_tie)
  case who_won
  when "Player"
    win_lose_tie[0] += 1
  when "Dealer"
    win_lose_tie[1] += 1
  when "Tie"
    win_lose_tie[2] += 1
  end
  prompt "Player has #{win_lose_tie[0]}"
  prompt "Dealer has #{win_lose_tie[1]}"
  prompt "Ties are #{win_lose_tie[2]}"
end

def start_game
  system 'clear'
  prompt "Welcome to BlackJack"
  loop do
    prompt "What would you like to play up to? 1 - 50"
    winning_score = gets.chomp.to_i
    if (1..50).include?(winning_score)
      return winning_score
    end  
  end
end  
  
loop do
  win_lose_tie = Array.new(3,0)
  win_amount = start_game
  loop do
    new_deck = shuffle_deck(DECK)
    player_hand = []
    computer_hand = []
    new_hand(new_deck, player_hand, computer_hand)
    before_dealer_shows = 2 # 2 means dealer hides a card
    display_both_hands(player_hand, computer_hand, before_dealer_shows)
    hit_or_stay(new_deck, player_hand, computer_hand, before_dealer_shows)
    decide_what_computer_does(new_deck, player_hand, computer_hand)
    winner = declare_winner(player_hand, computer_hand)
    prompt "You had #{count_hand(player_hand)}"
    prompt "The dealer had #{count_hand(computer_hand)}"
    prompt "And the winner is ... #{winner}"
    keep_score(winner, win_lose_tie)
    break unless win_lose_tie[0] < win_amount
    break unless win_lose_tie[1] < win_amount
  end
  break unless play_again?
end
# twenty_one.rb

CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace'].freeze
SUITS = ["Clubs", "Diamonds", "Hearts", "Spades"].freeze
DECK = { "Clubs" => CARDS, "Diamonds" => CARDS, "Hearts" => CARDS, "Spades" => CARDS }
DECK_SIZE = 52
NUM_PLAYERS = 2
PLAY_UP_TO = 21
COMP_HITS_UP_TO = 17

def prompt(msg)
  puts msg
end

# shuffle just the card numbers, pair each suit with a card,
# add arrays of [suit, card#] to suit_and_card nested array
# [[suit, card#], [suit, card#]...]
def shuffle_deck(deck)
  deck.each_key do |key| # get each suit shuffled
    deck[key] = CARDS.shuffle
  end
  suit_and_card = []
  card = []
  deck.each_key do |key|
    card = deck[key]
    (0..12).each do |i|
      suit_and_card.push([key, card[i]]) # pair suit with card
    end
  end
  suit_and_card.shuffle! # then shuffle the whole nested array
end

def face_card_int(crd_value)
  case crd_value
  when 'Jack'
    return 10
  when 'Queen'
    return 10
  when 'King'
    return 10
  when 'Ace'
    return 1
  end
  crd_value
end

def display_both_hands(player_hand, computer_hand, before_dealer_shows)
  # system 'clear'
  prompt "Your cards are: "
  player_hand.each do |card|
    print "#{card[1]} of #{card[0]} "
  end
  puts ""
  prompt "The computer has: "
  if before_dealer_shows == 2
    print "#{computer_hand[0][1]} of #{computer_hand[0][0]} and [?]"
  else
    computer_hand.each do |card|
      print "#{card[1]} of #{card[0]} "
    end
  end
  puts ""
end

def deal_card!(dck, hand)
  hand.push(dck.pop)
end

def count_hand(hand)
  sum = 0
  has_ace = false
  hand.each do |card|
    sum += face_card_int(card[1])
    if card[1] == 'Ace'
      has_ace = true
    end
  end
  if has_ace && (sum + 10 <= PLAY_UP_TO)
    return sum + 10
  else
    sum
  end
end

def new_hand(dck, play1, play2)
  2.times do
    deal_card!(dck, play1)
    deal_card!(dck, play2)
  end
end

def hit_or_stay(dck, hand, hand2, before_dealer_shows)
  loop do
    prompt "Do you want to hit(press 1) or stay(press 2)"
    ans = gets.chomp.to_i
    case ans
    when 1
      hand = deal_card!(dck, hand)
      display_both_hands(hand, hand2, before_dealer_shows)
      if count_hand(hand) > 21
        return hand
      end
    when 2
      return hand
    else
      hit_or_stay(dck, hand, hand2, before_dealer_shows)
    end
  end
end

def computer_hit(dck, hand)
  comp_score = count_hand(hand)
  while comp_score < COMP_HITS_UP_TO
    hand.push(dck.pop)
    comp_score = count_hand(hand)
  end
end

def declare_winner(player_hand, computer_hand)
  comp_count = count_hand(computer_hand)
  play_count = count_hand(player_hand)
  if play_count > PLAY_UP_TO
    "Dealer"
  elsif comp_count > PLAY_UP_TO || comp_count < play_count
    "Player"
  elsif comp_count > play_count
    "Dealer"
  else
    "Tie"
  end
end

def play_again?
  puts "-------------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def decide_what_computer_does(new_deck, player_hand, computer_hand)
  if count_hand(player_hand) > PLAY_UP_TO
    before_dealer_shows = 1
    display_both_hands(player_hand, computer_hand, before_dealer_shows)
    prompt "BUSTED"
  else
    computer_hit(new_deck, computer_hand)
    before_dealer_shows = 1
    display_both_hands(player_hand, computer_hand, before_dealer_shows)
  end
end

def keep_score(who_won, win_lose_tie)
  case who_won
  when "Player"
    win_lose_tie[0] += 1
  when "Dealer"
    win_lose_tie[1] += 1
  when "Tie"
    win_lose_tie[2] += 1
  end
  prompt "Player has #{win_lose_tie[0]}"
  prompt "Dealer has #{win_lose_tie[1]}"
  prompt "Ties are #{win_lose_tie[2]}"
end

def start_game
  system 'clear'
  prompt "Welcome to BlackJack"
  loop do
    prompt "What would you like to play up to? 1 - 50"
    winning_score = gets.chomp.to_i
    if (1..50).include?(winning_score)
      return winning_score
    end  
  end
end  
  
loop do
  win_lose_tie = Array.new(3,0)
  win_amount = start_game
  loop do
    new_deck = shuffle_deck(DECK)
    player_hand = []
    computer_hand = []
    new_hand(new_deck, player_hand, computer_hand)
    before_dealer_shows = 2 # 2 means dealer hides a card
    display_both_hands(player_hand, computer_hand, before_dealer_shows)
    hit_or_stay(new_deck, player_hand, computer_hand, before_dealer_shows)
    decide_what_computer_does(new_deck, player_hand, computer_hand)
    winner = declare_winner(player_hand, computer_hand)
    prompt "You had #{count_hand(player_hand)}"
    prompt "The dealer had #{count_hand(computer_hand)}"
    prompt "And the winner is ... #{winner}"
    keep_score(winner, win_lose_tie)
    break unless win_lose_tie[0] < win_amount
    break unless win_lose_tie[1] < win_amount
  end
  break unless play_again?
end
