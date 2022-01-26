require 'oystercard'

describe Oystercard do 
  oystercard = Oystercard.new
  it 'should have a default balance of zero' do 
    expect(subject.balance).to eq (0)
  end
  it 'should top-up the balance' do
    expect(subject.top_up(50)).to eq subject.balance
  end
  it 'sets maximum limit on card' do
    expect(Oystercard::MAX_BALANCE).to eq(90) 
  end
  it 'deducts fare from card' do
    expect(subject.deduct(5)). to eq subject.balance
  end
  it 'tracks when cards in use' do
    expect(subject).not_to be_in_journey
  end
  it 'can touch in' do
    oystercard = Oystercard.new
    subject.top_up(50)
    subject.touch_in
    expect(subject).to be_in_journey
  end
  it 'can touch out' do
    subject.touch_out
    expect(subject).not_to be_in_journey 
  end
  it 'checks min balance on card for touch in' do
    expect { subject.touch_in }.to raise_error "Insufficient balance to touch in."
  end
end

