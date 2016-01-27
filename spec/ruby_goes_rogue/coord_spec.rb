require 'spec_helper'

module RubyGoesRogue
  describe Coord do
    describe '#initialize' do
      let(:x) { 123 }
      let(:y) { -200 }

      it 'sets the x and y coordinates to the parameters given' do
        coord = Coord.new(x, y)
        expect(coord.x).to eq x
        expect(coord.y).to eq y
      end
    end

    describe '#==' do
      context 'given an object that does not respond to #x/#y' do
        let(:lhs) { Coord.new(-3, 5) }
        let(:rhs) { :foo }

        it 'returns false' do
          expect(lhs == rhs).to be_falsey
        end
      end

      context 'given a coord with the same coordinates' do
        let(:lhs) { Coord.new(-3, 5) }
        let(:rhs) { Coord.new(-3, 5) }

        it 'returns true' do
          expect(lhs == rhs).to be_truthy
        end
      end

      context 'given a coord with a different x-coordinate' do
        let(:lhs) { Coord.new(-3, 5) }
        let(:rhs) { Coord.new(5, 5) }

        it 'returns true' do
          expect(lhs == rhs).to be_falsey
        end
      end

      context 'given a coord with a different y-coordinate' do
        let(:lhs) { Coord.new(-3, 5) }
        let(:rhs) { Coord.new(-3, 8) }

        it 'returns true' do
          expect(lhs == rhs).to be_falsey
        end
      end
    end

    describe '#+' do
      context 'given another coord' do
        let(:lhs) { Coord.new(1, 2) }
        let(:rhs) { Coord.new(3, 4) }
        let(:sum) { lhs + rhs }

        it 'returns a new instance' do
          expect(sum).to_not be(lhs)
          expect(sum).to_not be(rhs)
        end

        it 'sums the coordinates' do
          expect(sum.x).to eq(lhs.x + rhs.x)
          expect(sum.y).to eq(lhs.y + rhs.y)
        end
      end
    end

    describe '#-' do
      context 'given another coord' do
        let(:lhs) { Coord.new(1, 2) }
        let(:rhs) { Coord.new(3, 4) }
        let(:difference) { lhs - rhs }

        it 'returns a new instance' do
          expect(difference).to_not be(lhs)
          expect(difference).to_not be(rhs)
        end

        it 'subtracts the coordinates' do
          expect(difference.x).to eq(lhs.x - rhs.x)
          expect(difference.y).to eq(lhs.y - rhs.y)
        end
      end
    end

    describe '#to_s' do
      let(:coord) { Coord.new(1, -2) }

      it 'returns a string representation of the coord' do
        expect(coord.to_s).to eq 'p(1, -2)'
      end
    end

    describe '#to_a' do
      let(:coord) { Coord.new(1, -2) }

      it 'returns an array representation of the coord' do
        expect(coord.to_a).to eq [1, -2]
      end
    end
  end
end
