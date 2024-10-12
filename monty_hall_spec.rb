require 'rspec'
require_relative 'C:/codes/ruby/monty_hall'

RSpec.describe MontyHall do

  describe '#play' do
    it 'increases wins when gamer changes choice and wins' do
      game = MontyHall.new(1)
      allow_any_instance_of(Object).to receive(:rand).and_return(1, 2, 3)
      game.play(1)
      expect(game.wins).to eq(1)
      expect(game.losses).to eq(0)
    end

    it 'increases losses when gamer changes choice and loses' do
      game = MontyHall.new(1) 
      allow_any_instance_of(Object).to receive(:rand).and_return(1, 2, 3)
      game.play(1)
      expect(game.wins).to eq(0)
      expect(game.losses).to eq(1)
    end

    it 'does not win when gamer does not change choice' do
      game = MontyHall.new(0)
      allow_any_instance_of(Object).to receive(:rand).and_return(1, 2, 3)
      game.play(1)
      expect(game.wins).to eq(0)
      expect(game.losses).to eq(1)
    end

    it 'calculates the correct number of games played' do
      game = MontyHall.new(1)
      game.play(10000)
      expect(game.wins + game.losses).to eq(10000)
    end
  end
end