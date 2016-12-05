require 'battle'
require 'kudomon'

describe Battle do

  let(:trainer1){ double('trainer1', :captured_cudomons => ([kudomon1])) }
  let(:trainer2){ double('trainer2', :captured_cudomons => ([kudomon2])) }
  let(:trainer_loser){ double(:loser, :captured_cudomons => ([dead_fighter])) }
  let(:kudomon1) { double('kudomon1', :type => 'grass', :species => 'Sourbulb', :combat => 3, :health => 9) }
  let(:kudomon2) { double('kudomon2', :type => 'rock', :species => 'Aerodactyl', :combat => 4, :health => 12) }
  let(:dead_fighter) { double(:kudomon, :health => 0) }
  subject(:finished_game) { described_class.new([trainer_loser, trainer2]) }

  before(:example) do
    @battle = Battle.new([trainer1, trainer2])
  end

  it 'allows to choose a kudomon from captured' do
    expect(@battle.select_kudomon(trainer1,0)).to eq [kudomon1]
    expect(@battle.select_kudomon(trainer1,0)).to eq nil
  end

  it 'allows a random kudomon to go first' do
    @battle.select_kudomon(trainer1,0)
    @battle.select_kudomon(trainer2,0)
    expect(@battle.instance_variable_get(:@fighters)).to include kudomon1
    expect(@battle.instance_variable_get(:@fighters)).to include kudomon2
  end

  describe '#switch_turns' do
    it 'switches the turn' do
      @battle.switch_turns
      expect(@battle.instance_variable_get(:@current_turn)).to eq @battle.instance_variable_get(:@second_fighter)
    end
  end

  describe '#deal_damage' do
    it 'can #deal_damage to the opponent' do
      @battle.select_kudomon(trainer1,0)
      @battle.select_kudomon(trainer2,0)
      @battle.who_goes_first
      second_fighter = @battle.instance_variable_get(:@second_fighter)
      expect(second_fighter).to receive(:receive_damage)
      @battle.deal_damage second_fighter
    end
  end

  describe '#game_over?' do
    it 'returns false if no-one is at 0 health' do
      @battle.select_kudomon(trainer1,0)
      @battle.select_kudomon(trainer2,0)
      expect(@battle.game_over?).to be false
    end

    it 'returns true if at least one fighter is at 0 health' do
      finished_game.select_kudomon(trainer_loser,0)
      finished_game.select_kudomon(trainer2,0)
      expect(finished_game.game_over?).to be true
    end
  end

  describe '#loser' do
    it 'returns a fighter on less than 0 health' do
      finished_game.select_kudomon(trainer_loser,0)
      finished_game.select_kudomon(trainer2,0)
      expect(finished_game.loser).to eq dead_fighter
    end
  end

  it 'has a special_fight type fight' do
    @battle.instance_variable_set(:@fighters, [Kudomon.new(:type=>'grass'), Kudomon.new(:type=>'rock')])
    second_fighter = @battle.instance_variable_get(:@fighters)[1]
    @battle.deal_damage second_fighter
    expect(@battle.loser.type).to eq 'rock'
  end
end
