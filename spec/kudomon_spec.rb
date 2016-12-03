require 'kudomon'

describe Kudomon do
  it 'creates kudomon of given type' do
    kudomon = described_class.new('fire')
    expect(kudomon.species).to eq 'Mancharred'
  end

  it 'has position' do
    kudomon = described_class.new('water')
    expect(kudomon).to respond_to :position
  end
end
