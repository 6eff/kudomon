class Kudomon
attr_reader :type, :species, :position, :health, :combat

  def initialize(args = {})
    @kudomons_hash = args[:kudomons_hash] ||= default_types
    @type = args[:type]
    raise(ArgumentError, "That kudomon type does not exist, can be added at initialize in {'type' => {:species => 'species', :health => health, :combat => combat}} format") if @kudomons_hash[@type].nil?
    @species = @kudomons_hash[@type][:species]
    @position = positioning
    @captured = false
    @health = @kudomons_hash[@type][:health]
    @combat = @kudomons_hash[@type][:combat]
  end

  def default_types
    {'grass' => {:species => 'Sourbulb', :health => 9, :combat => 3}, 'fire' => {:species => 'Mancharred', :health => 9, :combat => 3}, 'electric' => {:species => 'Chikapu', :health => 6, :combat => 2}, 'water' => {:species => 'Blastoise', :health => 3, :combat => 1}, 'rock' => {:species => 'Aerodactyl', :health => 12, :combat => 4}, 'psychic' => {:species => 'Mew', :health => 6, :combat => 2}}
  end

  def positioning
    [rand, rand]
  end

  def captured?
    @captured
  end

  def capture
    @captured = true
  end

  def receive_damage attacker
    @health -= attacker.combat
  end

  def trounce
    @health = 0
  end
end
