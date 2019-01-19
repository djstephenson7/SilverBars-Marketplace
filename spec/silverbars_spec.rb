require './lib/silverbars'
describe SilverBars do
  describe 'show' do
    it 'displays an array of hashes' do
      expect(subject.show).to eq([])
    end
  end

  describe 'add' do
    it 'Adds a new order to the order history array' do
      subject.add(1, 3.5, 300, 'BUY')
      expect(subject.show)
        .to eq([{ id: 1, quantity: 3.5, price: 300, type: 'BUY' }])
    end
  end
end
