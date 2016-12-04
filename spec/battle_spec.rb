require 'battle'

describe Battle do
  let(:trainer1){ double('trainer1', :captured_cudomons => kudomon1) }
  let(:trainer2){ double('trainer2', :captured_cudomons => kudomon2) }
  let(:kudomon1) { double('kudomon1', :type => 'grass', :species => 'Sourbulb', :combat => 3, :health => 9) }
  let(:kudomon2) { double('kudomon2', :type => 'grass', :species => 'Mancharred', :combat => 3, :health => 9) }

  it 'allows a random kudomon to go first' do
    battle = Battle.new([trainer1, trainer2])
    first_player = battle.instance_variable_get(:@first_player)
    second_player = battle.instance_variable_get(:@second_player)
    expect([trainer1, trainer2]).to include first_player
    expect([trainer1, trainer2]).to include second_player
    expect(first_player).not_to eq second_player
  end

  it 'allows to choose a kudomon species from captured' do
    battle = Battle.new([trainer1, trainer2])
    expect(battle.select_kudomon(trainer1,'Sourbulb')).to eq 'Sourbulb'
    expect(battle.select_kudomon(trainer1,'Sourbulb')).not_to eq 'Mancharred'
  end
end
