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

  describe 'show' do
    it 'sorts the BUY items with the highest prices first' do
      subject.add(1, 3.5, 300, 'BUY')
      subject.add(2, 1.5, 307, 'BUY')
      subject.add(3, 2.5, 303, 'BUY')
      expect { subject.show }
        .to output("BUY: 1.5kg for £307 [user2]\nBUY: 2.5kg for £303 [user3]\nBUY: 3.5kg for £300 [user1]\n")
        .to_stdout
    end
    it 'sorts the SELL items with the lowest prices first' do
      subject.add(1, 3.5, 300, 'SELL')
      subject.add(2, 1.5, 307, 'SELL')
      subject.add(3, 2.5, 303, 'SELL')
      expect { subject.show }
        .to output("SELL: 3.5kg for £300 [user1]\nSELL: 2.5kg for £303 [user3]\nSELL: 1.5kg for £307 [user2]\n")
        .to_stdout
    end
    it 'Merges orders with identical prices together' do
      subject.add(1, 3.5, 300, 'SELL')
      subject.add(2, 3.5, 300, 'SELL')
      expect { subject.show }
        .to output("SELL: 7.0kg for £300\n")
        .to_stdout
    end
  end

  describe 'delete_buy' do
    it 'Removes an order hash from the buy history array' do
      subject.add(1, 3.5, 300, 'BUY')
      subject.add(2, 1.5, 450, 'BUY')
      subject.add(2, 1.5, 450, 'SELL')
      subject.delete_buy
      expect { subject.show }
        .to output("BUY: 3.5kg for £300 [user1]\nSELL: 1.5kg for £450 [user2]\n")
        .to_stdout
    end
  end

  describe 'delete_sell' do
    it 'Removes an order hash from the sell history array' do
      subject.add(1, 3.5, 300, 'SELL')
      subject.add(2, 1.5, 450, 'SELL')
      subject.add(2, 1.5, 450, 'BUY')
      subject.delete_sell
      expect { subject.show }
        .to output("BUY: 1.5kg for £450 [user2]\nSELL: 3.5kg for £300 [user1]\n")
        .to_stdout
    end
  end
end
