class Kudomon
attr_reader :species, :position

  def initialize(type, kudomons_hash = default_types)
    @kudomons_hash = kudomons_hash
    @type = type
    @species = kudomons_hash[type]
    @position = positioning
  end

  def default_types
    {'grass' => 'Sourbulb', 'fire' => 'Mancharred', 'electric' => 'Chikapu', 'water' => 'Blastoise', 'rock' => 'Aerodactyl', 'psychic' => 'Mew'}
  end

  def positioning
    [rand, rand]
  end

end
