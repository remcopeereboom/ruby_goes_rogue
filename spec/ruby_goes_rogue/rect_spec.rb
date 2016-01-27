require 'spec_helper'

module RubyGoesRogue
  describe 'Rect' do
    describe '#initalize' do
      context 'given a negative width' do
        let(:width) { -5 }
        let(:height) { 3 }

        it 'throws an ArgumentError' do
          expect { Rect.new(width, height) }.to raise_error ArgumentError
        end
      end

      context 'given a negative height' do
        let(:width) { 5 }
        let(:height) { -3 }

        it 'throws an ArgumentError' do
          expect { Rect.new(width, height) }.to raise_error ArgumentError
        end
      end

      context 'given a valid width and a valid height' do
        let(:width) { 5 }
        let(:height) { 3 }
        let(:rect) { Rect.new(width, height) }

        it 'sets the proper dimensions' do
          expect(rect.width).to eq width
          expect(rect.height).to eq height
        end

        it 'has an xrange starting at 0' do
          expect(rect.xmin).to eq 0
        end

        it 'has an xrange ending at width - 1' do
          expect(rect.xmax).to eq(width - 1)
        end

        it 'has an yrange starting at 0' do
          expect(rect.ymin).to eq 0
        end

        it 'has an yrange ending at height - 1' do
          expect(rect.ymax).to eq(height - 1)
        end
      end

      context 'given an xrange with xmin > xmax' do
        let(:xrange) { 0..-3 }
        let(:yrange) { 0..3 }

        it 'throws an ArgumentError' do
          expect { Rect.new(xrange, yrange) }.to raise_error ArgumentError
        end
      end

      context 'given an yrange with ymin > ymax' do
        let(:xrange) { 0..3 }
        let(:yrange) { 0..-3 }

        it 'throws an ArgumentError' do
          expect { Rect.new(xrange, yrange) }.to raise_error ArgumentError
        end
      end

      context 'given a valid xrange and a valid yrange' do
        let(:xrange) { 0...9 }
        let(:yrange) { -3..6 }
        let(:rect) { Rect.new(xrange, yrange) }

        it 'sets the ranges' do
          expect(rect.xrange).to eq xrange
          expect(rect.yrange).to eq yrange
        end
      end
    end

    describe '#each' do
      context 'given a block' do
        let(:rect) { Rect.new(1..3, 4..5) }
        let(:expected) do
          [Coord.new(1, 4), Coord.new(2, 4), Coord.new(3, 4),
           Coord.new(1, 5), Coord.new(2, 5), Coord.new(3, 5)]
        end

        it 'yields the successive coords' do
          expect { |b| rect.each(&b) }.to yield_successive_args(*expected)
        end

        it 'returns self' do
          expect(rect.each {}).to be rect
        end
      end

      context 'not given a block' do
        let(:rect) { Rect.new(1..3, 4..5) }
        let(:enumerator) { rect.each }

        it 'returns an enumerator to the successive coords' do
          expect(enumerator).to be_a Enumerator
          expect(enumerator.next).to eq Coord.new(1, 4)
          expect(enumerator.next).to eq Coord.new(2, 4)
          expect(enumerator.next).to eq Coord.new(3, 4)
          expect(enumerator.next).to eq Coord.new(1, 5)
          expect(enumerator.next).to eq Coord.new(2, 5)
          expect(enumerator.next).to eq Coord.new(3, 5)
          expect { enumerator.next }.to raise_error StopIteration
        end
      end
    end

    describe '#==' do
      context 'given a rectangle with the same domain' do
        let(:lhs) { Rect.new(1..2, 3..4) }
        let(:rhs) { Rect.new(1...3, 3..4) }

        it 'returns true' do
          expect(lhs == rhs).to be_truthy
        end
      end
      context 'given a rectangle with a different domain' do
        let(:lhs) { Rect.new(1..2, 3..4) }
        let(:rhs) { Rect.new(3..4, 1..2) }

        it 'returns false' do
          expect(lhs == rhs).to be_falsey
        end
      end
      context 'given something else' do
        let(:lhs) { Rect.new(1..2, 3..4) }
        let(:rhs) { :foo }

        it 'returns false' do
          expect(lhs == rhs).to be_falsey
        end
      end
    end

    describe '#to_s' do
      let(:rect) { Rect.new(2..3, 4...6) }
      let(:expected) { 'rc(x:2..3, y:4..5)' }

      it 'returns a String representation of the Rect' do
        expect(rect.to_s).to eq expected
      end
    end
  end
end
