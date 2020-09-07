require 'oyster-card'
describe Oystercard do

  it 'is an instance of oystercard' do
    expect(subject).to be_an_instance_of(Oystercard)
  end

  it 'has a balance' do
    expect(subject).to respond_to(:balance)
  end
end