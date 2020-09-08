require "journey"

describe Journeys do

let(:entry_station) { double :station }
let(:exit_station) { double :station }
let(:journey) { { :beginning => entry_station, :end => exit_station} }

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
    subject.touch_in(entry_station)
    expect(subject.in_journey?).to eq true
  end

  it "sets @travelling to false when touch_out is called" do
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.in_journey?).to eq false
  end

  ## move over to oyster_spec?
  #it "raises insufficient funds error if balance is below 1 when touching in" do
  #  expect {subject.touch_in(entry_station)}.to raise_error "Insufficient funds"
  #end

  #it "deducts the minimum fare from balance on touch_out" do
    
  #  subject.touch_in(entry_station)
  #  expect {subject.touch_out(exit_station) }. to change{subject.balance}.by((Oystercard::MINIMUM_FARE)/-1)
  #end

  
  it "Stores the entry station" do
    subject.touch_in(entry_station)
    expect(subject.entry_station).to eq entry_station
  end
  
  it "Stores the exit station" do 
    subject.touch_out(exit_station)
    expect(subject.exit_station).to eq exit_station
  end 
  it "The journey list is empty by default" do
    expect(subject.journeys).to be_empty
  end
  it "Adds a journey to the journey hash" do
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.journeys).to eq journey 
  end
end
