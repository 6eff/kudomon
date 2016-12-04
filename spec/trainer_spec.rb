require 'trainer'
require 'kudomon'

describe Trainer do
  it 'has a position' do
    trainer = described_class.new
    expect(trainer).to respond_to :position
  end

  context 'there are kudomons around' do
    let(:kudomon1) { double('kudomon1', :type => 'grass', :species => 'Sourbulb', :position => [0.0001, 0.1], :captured => false) }
    let(:kudomon2) { double('kudomon2', :type => 'grass', :species => 'Sourbulb', :position => [0.10, 0.10]) }

    it 'can look around for nearby kudomons' do
      trainer = described_class.new
      allow(trainer).to receive(:position).and_return([0.0001, 0.0001])
      kudomons = [kudomon1, kudomon2]
      expect(trainer.whos_nearby(kudomons)).to eq [kudomon1]
    end

    it "can catch a nearby kudomon if he's not captured" do
      trainer = described_class.new
      allow(trainer).to receive(:position).and_return([0.0001, 0.0001])
      kudomon = Kudomon.new(:type => 'fire')
      kudomon.instance_variable_set(:@position,[0.0001, 0.0001])
      trainer.catch_kudomon(kudomon)
      expect(trainer.captured_cudomons).to include kudomon
      expect(trainer.captured_cudomons[0].captured?).to eq true
      trainer.catch_kudomon(kudomon)
      expect(trainer.captured_cudomons.size).to eq 1
    end
  end
end
