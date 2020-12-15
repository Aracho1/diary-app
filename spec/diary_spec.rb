require 'diary'

describe 'Diary' do
  let(:diary) { Diary.new }

  describe "#add" do
    it 'adds a diary entry' do
      diary.add('title', 'entry')
      expect(diary.entries).to eq ({'title' => 'entry'})
    end
  end

end