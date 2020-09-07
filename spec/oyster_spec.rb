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

  it 'has a deduct method' do
    expect(subject).to respond_to(:deduct).with(1).argument
  end

  it "deducts the fare from the balance" do
    subject.top_up(10)
    expect(subject.deduct(5)).to eq 5
  end

  it "has an 'in_journey?' method" do
    expect(subject).to respond_to(:in_journey?)
  end

  it "has a touch_in method" do
    expect(subject).to respond_to(:touch_in)
  end

  it "it has a touch_out method" do
    expect(subject).to respond_to(:touch_out)
  end

  it "in_journey returns a boolean" do
    expect(subject.in_journey?).to eq(true).or eq false
  end

  it "sets @travelling to true when touch in is called" do
    subject.balance = 50
    subject.touch_in
    expect(subject.in_journey?).to eq true
  end

  it "sets @travelling to false when touch_out is called" do
    subject.balance = 2
    subject.touch_in
    subject.touch_out
    expect(subject.in_journey?).to eq false
  end

  it "raises insufficient funds error if balance is below 1 when touching in" do
    expect {subject.touch_in}.to raise_error "Insufficient funds"
  end

  it "deducts the minimum fare from balance on touch_out" do
    subject.balance = 5
    subject.touch_in
    expect {subject.touch_out}. to change{subject.balance}.by((Oystercard::MINIMUM_FARE)/-1)
  end

end