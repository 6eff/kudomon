class Battle

def initialize trainers
  @trainers = trainers
  raise(ArgumentError, "Enter trainers in array form [t1, t2]") if @trainers.nil? || @trainers.size == 0
  @first_player = goes_first
  @second_player = goes_second
end

def goes_first
  @trainers.sample
end

def goes_second
  if @trainers.index(@first_player) == 1
    @trainers[0]
  else
    @trainers[1]
  end
end

def select_kudomon player, species
  player.captured_cudomons.species
end


end
