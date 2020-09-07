require 'oyster-card'
describe Oystercard do

  it 'is an instance of oystercard' do
    expect(subject).to be_an_instance_of(Oystercard)
  end

  it 'has a balance' do
    expect(subject).to respond_to(:balance)
  end

  it 'has a top_up method that responds to 1 argument' do
    expect(subject).to respond_to(:top_up).with(1).argument
  end

  it 'will increase @balance by 5 when topped up' do
    card = Oystercard.new
    card.top_up(5)
    expect(card.balance).to eq 5
  end
  it 'will not let the @balance be more than MAX_BALANCE' do
    expect { subject.top_up(100) }.to raise_error "The maximum is #{Oystercard::MAX_BALANCE}"
  end
end