require 'station'

describe Station do
  subject { described_class.new('name', 'zone') }

  it 'has a zone' do
    expect(subject.zone).to eq 'zone'
  end

  it 'has a name' do
    expect(subject.name).to eq 'name'
  end
  
end