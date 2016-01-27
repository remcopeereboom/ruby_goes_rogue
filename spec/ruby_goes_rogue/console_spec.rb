require 'spec_helper'

module RubyGoesRogue
  describe Console do
    describe '#initialize' do
      context 'given a negative width' do
        let(:width) { -5 }
        let(:height) { 4 }

        it 'raises an ArgumentError' do
          expect { Console.new(width, height) }.to raise_error ArgumentError
        end
      end

      context 'given a negative height' do
        let(:width) { 5 }
        let(:height) { -4 }

        it 'raises an ArgumentError' do
          expect { Console.new(width, height) }.to raise_error ArgumentError
        end
      end

      context 'given a valid with and a valid height' do
        let(:width) { 2 }
        let(:height) { 3 }
        let(:console) { Console.new(width, height) }

        it 'creates a proper rectangle' do
          expect(console.rect).to eq Rect.new(width, height)
        end

        it 'creates the proper cells' do
          console.rect.each do |c|
            expect(console[c]).to eq Console.clear_cell
          end
        end
      end
    end
  end
end
