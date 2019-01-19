require './lib/silverbars'
describe SilverBars do
  describe 'show' do
    it 'displays an array of hashes' do
      expect(subject.show).to eq([])
    end
  end
end
