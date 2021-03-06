class Trainer
attr_reader :position, :captured_cudomons

  def initialize
    @position = positioning
    @captured_cudomons = []
  end

  def positioning
    [rand, rand]
  end

  def whos_nearby kudomons
    kudomons_nearby = []
    kudomons.each do |kudomon|
      kudomons_nearby << kudomon if nearby?(kudomon.position)
    end
    kudomons_nearby
  end

  def nearby? coordinates
    true if (position[0] - coordinates[0]).abs < 0.0001 or (position[1] - coordinates[1]).abs < 0.0001
  end

  def catch_kudomon kudomon
    captured_cudomons << kudomon if nearby? kudomon.position and !kudomon.captured?
    kudomon.capture
  end

end
