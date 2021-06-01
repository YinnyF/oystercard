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
