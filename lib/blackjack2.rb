#Welcomes player
def welcome
 puts "Welcome to the Blackjack Table"
 sleep(1)
end

#Deals a card
def deal_card
  [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11].sample
end

#Displays players card total
def display_card_total(card_total)
  puts "Your cards add up to #{card_total}"
  sleep(1)
end

#Displays dealers first card
def display_card_dealer(card1_dealer)
  puts "The dealer is showing one card with a value of #{card1_dealer}"
  sleep(1)
end

#Prompts player to hit or stay
def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

#Gets input form player
def get_user_input
  gets.chomp
end

#Ends game if player busts
def end_game(card_total)
 sleep(0.5)
 print "Sorry, you hit #{card_total}. "
end

#Asks player if he wants to play again
def play_again
  puts "Type 'p' to play again or 'q' to quit"
  p_or_q = gets.chomp
  if p_or_q == "p"
    runner
  elsif p_or_q == "q" 
    abort
  else
    invalid_command_play_again
  end
end

#Deals dealers first card
def card1_dealer
  card1_dealer = deal_card
end

#Deals dealers second card
def card2_dealer
  card2_dealer = deal_card
end

#Calculate dealers card total
def card_total_dealer (card1, card2)
card_total_dealer = card1 + card2 
return card_total_dealer
end

#deals two cards for player
def initial_round
  card_total = deal_card + deal_card
  if card_total == 22
    card_total = 12
    display_card_total(card_total)
    return card_total
  else
    display_card_total(card_total)
    return card_total
  end
end

#deals a new card if player hits, doesn't if he stays
def hit?(new_card_total)
  prompt_user
  h_or_s = get_user_input
  new_card_total = new_card_total
  if h_or_s == "h"
    new_card_total = deal_card + new_card_total
    if new_card_total > 21
      display_card_total(new_card_total)
      puts "Busted! You lose."
      sleep(1)
      play_again
    else
      display_card_total(new_card_total)
      hit?(new_card_total)
      return new_card_total
    end
  elsif h_or_s == "s"
    return new_card_total
  else
    invalid_command
    return new_card_total
  end
end


#returns invalid command if user does not type h or s
def invalid_command
  puts "That is not a valid command"
  sleep(1)
end

#returns invlaid commmand if player does not type p or q
def invalid_command_play_again
  puts "That is not a valid command"
  sleep(1)
  play_again
end

#dealer reveals his hand
def dealer_reveal(card_total_dealer)
  if card_total_dealer == 22
    card_total_dealer =12
    puts "The dealer reveals his full card total of #{card_total_dealer}"
    sleep(1)
    return card_total_dealer
  else
    puts "The dealer reveals his full card total of #{card_total_dealer}"
    sleep(1)
    return card_total_dealer
  end
end

#hits for delaer is hand below 16
def dealer_hit?(card_total_dealer)
until card_total_dealer > 16 do
  puts "The dealer hits."
  sleep(1)
  card_total_dealer += deal_card
  puts "The dealer has a new card total of #{card_total_dealer}"
  sleep(1)
  end
  return card_total_dealer
end

#compares dealers and players hnad to detrimine winner
def compare_hands(card_total_dealer, card_total)
  if card_total_dealer == card_total
    puts "You pushed!"
    sleep(1)
  elsif card_total_dealer > 21 && card_total < 22
    puts "The dealer busts! You have won!"
    sleep(1)
  elsif card_total > card_total_dealer && card_total < 22 && card_total_dealer < 22
    puts "You have won!"
    sleep(1)
  else
    puts "You lost!"
    sleep(1)
  end
end


#####################################################
# get every test to pass before coding runner below #
#####################################################

#runs program
def runner
  welcome
  dc1 = card1_dealer
  dc2 = card2_dealer
  ctd = card_total_dealer(dc1, dc2)
  display_card_dealer(dc1)
  card_total = initial_round 
  new_card_total = hit?(card_total) 
  display_card_total(new_card_total)
  dealer_reveal(ctd)
  ctd = dealer_hit?(ctd)
  compare_hands(ctd, new_card_total)
  play_again
end


