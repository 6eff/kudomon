class Battle

def initialize trainers
  @trainers = trainers
  raise(ArgumentError, "Enter trainers in array form [t1, t2]") if @trainers.nil? || @trainers.size != 2
  @first_player = @trainers[0]
  @second_player = @trainers[1]
  @fighters = []
  @first_fighter
  @second_fighter
  @current_turn
end

def who_goes_first
  @first_fighter = @fighters.sample
  @current_turn = @first_fighter
  @second_fighter = opponent_of(@first_fighter)
end

def switch_turns
  @current_turn = opponent_of(@current_turn)
end

def opponent_of(the_fighter)
  @fighters.select { |fighter| fighter != the_fighter }.first
end

def select_kudomon player, index
  @fighters << player.captured_cudomons[index] if !@fighters.include?(player.captured_cudomons[index])
end

def deal_damage kudomon
  special_fight = opponent_of(kudomon).type + kudomon.type
  if ['waterfire', 'firegrass', 'grassrock', 'rockelectric', 'electricwater'].include?(special_fight)
    kudomon.trounce
  else
    kudomon.receive_damage(opponent_of(kudomon))
  end
end

def game_over?
  losing_fighters.any?
end

def loser
  losing_fighters.first
end

def losing_fighters
  @fighters.select { |fighter| fighter.health <= 0 }
end

private :opponent_of, :losing_fighters

end
