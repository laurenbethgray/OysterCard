require 'oystercard'

describe Oystercard do 
  let(:entry_station) { double :entry_station }
  
  it 'checks that the card has a balance' do
    expect(subject.balance).to eq 0
  end
  it 'should top-up the balance' do
    expect(subject.top_up(50)).to eq subject.balance
  end
  it 'sets maximum limit on card' do
    expect(Oystercard::MAX_BALANCE).to eq(90) 
  end
  it 'deducts fare from card' do
    expect(subject.send(:deduct ) )
  end
  it 'tracks when cards in use' do
    expect(subject).not_to be_in_journey
  end
  it 'can touch in' do
    subject.top_up(50)
    subject.touch_in(entry_station)
    expect(subject).to be_in_journey
  end
  it 'can touch out' do
    subject.touch_out
    expect(subject).not_to be_in_journey 
  end
  it 'checks min balance on card for touch in' do
    expect { subject.touch_in(entry_station) }.to raise_error "Insufficient balance to touch in."
  end
  it 'deducts fare from balance after journey' do
    expect{ subject.touch_out }.to change{ subject.balance }.by(subject.send(:deduct))
  end
end
