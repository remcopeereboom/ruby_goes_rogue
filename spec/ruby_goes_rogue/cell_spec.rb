require 'spec_helper'

module RubyGoesRogue
  describe Cell do
    describe '#initialize' do
      context 'given a string and 2 colors' do
        let(:glyph) { '@' }
        let(:fore_color) { Color::RED }
        let(:back_color) { Color::GREEN }
        let(:cell) { Cell.new(glyph, fore_color, back_color) }

        it 'calls #ord on the string' do
          expect(cell.glyph).to eq glyph.ord
          expect(cell.fore_color).to eq fore_color
          expect(cell.back_color).to eq back_color
        end
      end

      context 'given an integer and 2 colors' do
        let(:glyph) { 64 }
        let(:fore_color) { Color::RED }
        let(:back_color) { Color::GREEN }
        let(:cell) { Cell.new(glyph, fore_color, back_color) }

        it 'uses the integer as the sprite index' do
          expect(cell.glyph).to eq 64
          expect(cell.fore_color).to eq fore_color
          expect(cell.back_color).to eq back_color
        end
      end
    end

    describe '#==' do
      context 'given an object with missing attributes' do
        let(:lhs) { Cell.new(0, Color::BLACK, Color::BLACK) }
        let(:rhs) { :foo }

        it 'returns false' do
          expect(lhs == rhs).to be_falsey
        end
      end

      context 'given an object with different attributes' do
        let(:lhs) { Cell.new(0, Color::BLACK, Color::BLACK) }
        let(:rhs_1) { Cell.new(1, Color::BLACK, Color::BLACK) }
        let(:rhs_2) { Cell.new(0, Color::WHITE, Color::BLACK) }
        let(:rhs_3) { Cell.new(0, Color::BLACK, Color::WHITE) }

        it 'returns false' do
          expect(lhs == rhs_1).to be_falsey
          expect(lhs == rhs_2).to be_falsey
          expect(lhs == rhs_3).to be_falsey
        end
      end

      context 'given an object with the same attributes' do
        let(:lhs) { Cell.new(0, Color::BLACK, Color::BLACK) }
        let(:rhs) { Cell.new(0, Color::BLACK, Color::BLACK) }

        it 'returns true' do
          expect(lhs == rhs).to be_truthy
        end
      end
    end
  end
end
