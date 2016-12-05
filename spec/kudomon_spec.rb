require 'kudomon'

describe Kudomon do
  it 'creates kudomon of given type' do
    kudomon = described_class.new(:type => 'fire')
    expect(kudomon.species).to eq 'Mancharred'
  end

  it 'has position' do
    kudomon = described_class.new(:type => 'water')
    expect(kudomon).to respond_to :position
  end

  it 'can be captured' do
    kudomon = described_class.new(:type => 'water')
    expect(kudomon.captured?).to eq false
  end

  it 'can #receive_damage' do
    kudomon1 = described_class.new(:type => 'water')
    kudomon2 = described_class.new(:type => 'water')
    kudomon1.receive_damage(kudomon2)
    expect(kudomon1.health).to eq 2
  end
end
