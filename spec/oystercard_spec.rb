require 'oystercard'

describe Oystercard do
  context 'adding money to the card' do
    it 'returns 0 when you ask for the initial balance' do
      expect(subject.balance).to eq 0
    end
    
    it 'has an initial balance of 0 automagically' do
      expect(subject).to have_attributes(:balance => 0)
    end
  end

  context '#top_up' do

    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'should give us balance after topping up' do
      expect { subject.top_up(20) }.to change { subject.balance }.by 20
    end 

    it 'raises an error if balance exceeds the default maximum balance' do
      max_bal = Oystercard::MAXIMUM_BALANCE
      subject.top_up(max_bal)
      expect { subject.top_up(1) }.to raise_error "Balance exceeds #{max_bal}"
    end

  end
  context '#deduct' do
    it { is_expected.to respond_to(:deduct).with(1).argument }
    it 'deducts amount from the total balance' do
      subject.top_up(30)
      expect{ subject.deduct(5)}.to change{ subject.balance }.by (-5)
    end 
    it 'raises error if balance is too low' do
      expect { subject.deduct(1) }.to raise_error "Insufficient funds"
    end
  end


  
end

=begin
Issue Comments:
NameError - Raised when a given name is invalid or undefined.
uninitialized constant Oystercard - 
./spec/oystercard_spec.rb
line number - 3

Suggest resolve:
To create an Oystercard class.

Stack trace:
- shows the order of the error. 
- Ruby reads from top to bottom.

=end
