require 'station'
describe Station do
  it 'tells you what station name is' do
    station = Station.new
    expect(station.name("Newcastle")).to eq "Newcastle"
  end
  it 'tells you what zone' do
    station = Station.new
    expect(station.zone(11)).to eq 11
  end 


end
