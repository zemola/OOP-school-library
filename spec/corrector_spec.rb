require_relative '../corrector'

describe Corrector do
  context 'When passin a name' do
    corrector = Corrector.new
    it 'Should return first letter of name in uppercase' do
      expect(corrector.correct_name('mithi')).to eq 'Mithi'
    end

    it 'should return first 10 letter with first capital lerrer' do
      expect(corrector.correct_name('Victor')).to eq 'Victor'
    end
  end
end
