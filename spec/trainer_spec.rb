require 'trainer'
# require 'kudomon'

describe Trainer do
  it 'has a position' do
    trainer = described_class.new
    expect(trainer).to respond_to :position
  end

  context 'there are kudomons around' do
    let(:kudomon1) { double('kudomon1', :type => 'grass', :species => 'Sourbulb', :position => [0.0001, 0.1]) }
    let(:kudomon2) { double('kudomon2', :type => 'grass', :species => 'Sourbulb', :position => [0.10, 0.10]) }

    it 'can look around for nearby kudomons' do
      trainer = described_class.new
      allow(trainer).to receive(:position).and_return([0.0001, 0.0001])
      kudomons = [kudomon1, kudomon2]
      expect(trainer.whos_nearby(kudomons)).to eq [kudomon1]
    end
  end
end
