require './lib/silverbars'
require 'pry'
describe SilverBars do
  describe 'add' do
    it 'Adds a new order to the order history array' do
      subject.add(1, 3.5, 300, 'BUY')
      subject.add(2, 1.5, 310, 'SELL')
      expect { subject.show }
        .to output("BUY: 3.5kg for £300 [user1]\nSELL: 1.5kg for £310 [user2]\n")
        .to_stdout
    end
  end

  describe 'delete' do
    it 'Removes an order hash from the history array' do
      subject.add(1, 3.5, 300, 'BUY')
      subject.add(2, 1.5, 450, 'SELL')
      subject.delete
      expect { subject.show }
        .to output("BUY: 3.5kg for £300 [user1]\n").to_stdout
    end
  end
end
