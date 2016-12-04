class Kudomon
attr_reader :species, :position

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
    {'grass' => {:species => 'Sourbulb', :health => 2, :combat => 3}, 'fire' => {:species => 'Mancharred', :health => 2, :combat => 3}, 'electric' => {:species => 'Chikapu', :health => 2, :combat => 3}, 'water' => {:species => 'Blastoise', :health => 2, :combat => 3}, 'rock' => {:species => 'Aerodactyl', :health => 2, :combat => 3}, 'psychic' => {:species => 'Mew', :health => 2, :combat => 3}}
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

end
