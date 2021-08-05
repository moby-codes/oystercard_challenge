require 'station'

describe Station do
  
  subject(:station) {described_class.new("kings cross", 3) }

  describe 'initialises with a station name' do
    it 'responds to name' do
      expect(station).to respond_to(:name)
    end
  end

  describe 'initialises with a zone' do
    it 'responds to zone' do
      expect(station).to respond_to(:zone)
    end
  end

end