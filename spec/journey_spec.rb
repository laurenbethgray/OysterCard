require 'journey'
require 'oystercard'
require 'station'

describe Journey do
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }
  let(:journey) {Journey.new}

  

  it 'new card not in journey' do
    expect(subject).not_to be_in_journey
  end

  it 'is in journey after touch in' do
    subject.touch_in(entry_station)
    expect(subject).to be_in_journey
  end

  it 'is not in journey after touch out' do
    subject.touch_out(exit_station)
    expect(subject).not_to be_in_journey 
  end

  it 'forgets entry station after touch out' do
    subject.touch_out(exit_station)
    expect(subject.entry_station).to eq nil
  end

  it 'remembers entry station' do
    expect(subject.entry_station).to eq subject.entry_station
  end
    
  it 'remembers exit station when touched out' do
    subject.touch_out(exit_station)
    expect(subject.exit_station).to eq exit_station
  end



  it 'stores a journey' do
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.journeys).to eq [{entry_station => exit_station}]
  end
end
