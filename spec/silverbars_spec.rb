require './lib/silverbars'

describe SilverBars do
  describe 'add' do
    it 'Adds a new order to the order history array' do
      subject.add(1, 3.5, 300, 'BUY')
      subject.add(2, 1.5, 310, 'SELL')
      expect { subject.show }
        .to output("1. BUY: 3.5kg for £300 [user1]\n1. SELL: 1.5kg for £310 [user2]\n")
        .to_stdout
    end
  end

  describe 'show' do
    it 'sorts the BUY items with the highest prices first' do
      subject.add(1, 3.5, 300, 'BUY')
      subject.add(2, 1.5, 307, 'BUY')
      subject.add(3, 2.5, 303, 'BUY')
      expect { subject.show }
        .to output("1. BUY: 1.5kg for £307 [user2]\n2. BUY: 2.5kg for £303 [user3]\n3. BUY: 3.5kg for £300 [user1]\n")
        .to_stdout
    end
    it 'sorts the SELL items with the lowest prices first' do
      subject.add(1, 3.5, 300, 'SELL')
      subject.add(2, 1.5, 307, 'SELL')
      subject.add(3, 2.5, 303, 'SELL')
      expect { subject.show }
        .to output("1. SELL: 3.5kg for £300 [user1]\n2. SELL: 2.5kg for £303 [user3]\n3. SELL: 1.5kg for £307 [user2]\n")
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
        .to output("1. BUY: 3.5kg for £300 [user1]\n1. SELL: 1.5kg for £450 [user2]\n")
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
        .to output("1. BUY: 1.5kg for £450 [user2]\n1. SELL: 3.5kg for £300 [user1]\n")
        .to_stdout
    end
  end
end
