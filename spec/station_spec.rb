require "station"
describe Station do	
paddington = Station.new("Paddington", 1)

it "should have a station name " do 
	#paddington = Station.new("Paddington", 1)
	expect(paddington.station).to eq "Paddington"
	end
 it "should have a zone" do 
	#paddington = Station.new("Paddington", 1)
	expect(paddington.zone).to eq 1
 end 

end
