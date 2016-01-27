require 'spec_helper'

module RubyGoesRogue
  describe Color do
    describe '#to_s' do
      let(:color) { Color.rgba(1, 2, 3, 4) }

      it 'returns a string formatted as rgba(r, g, b, a)' do
        expect(color.to_s).to match(/\Argba\(\d+, \d+, \d+, \d+\)\z/)
      end
    end

    describe '#to_a' do
      let(:color) { Color.rgba(1, 2, 3, 4) }

      it 'returns an array of the form [r, g, b, a]' do
        expect(color.to_a).to eq [1, 2, 3, 4]
      end
    end
  end
end
