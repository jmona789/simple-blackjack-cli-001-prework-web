def welcome
 puts "Welcome to the Blackjack Table"
end

def deal_card
  rand(1..11)
end

def display_card_total(card_total)
  puts "Your cards add up to #{card_total}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  gets.chomp
end

def end_game(card_total)
 puts "Sorry, you hit #{card_total}. Thanks for playing!"
end

def initial_round
  card_total = deal_card + deal_card
  display_card_total(card_total)
  return card_total
end

def hit?(new_card_total)
  prompt_user
  h_or_s = get_user_input
  if h_or_s == "h" 
    newer_card_total = deal_card + new_card_total
    return newer_card_total
  elsif h_or_s == "s"
   return new_card_total
 else
  invalid_command
  return new_card_total
  end
end

def invalid_command
  puts "That is not a valid command"
  sleep(1)
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
 welcome
 card_total = initial_round
 until card_total > 21 
  card_total = hit?(card_total)
  display_card_total(card_total)
  end
    end_game(card_total)
end
