require 'spec_helper'
require 'game'

RSpec.describe Game do
  describe '#outcome' do
    context 'in a one player game' do
      subject { described_class.new(players: ['Engelbert']) }
      context 'when the player chose rock and cpu chose scissors' do
        before do
          subject.player_weapon = 'Rock'
        end
        it 'declares the winner' do
          srand(3)
          expect(subject.outcome).to eq 'You win, Engelbert!'
        end
      end
    end
  end

  describe '#current_player' do
    context 'in a two player game' do
      subject { described_class.new(players: ['Engelbert', 'June']) }
      context 'no weapons have been chosen' do
        it 'returns the name of player one' do
          expect(subject.current_player).to eq 'Engelbert'
        end 
      end

      context 'player one has chosen a weapon' do
        before { subject.player_weapon = 'rock' }
        it 'returns the name of player two' do
          expect(subject.current_player).to eq 'June'
        end 
      end
    end
  end

  describe '#pending_weapon_choice?' do
    context 'in a two player game' do
      subject { described_class.new(players: ['Engelbert', 'June']) }
      context 'when player one has chosen a weapon but player two has not' do
        before { subject.player_weapon = 'rock' }
        it 'returns true' do
          expect(subject.pending_weapon_choice?).to eq true
        end
      end
    end

    context 'in a one player game' do
      subject { described_class.new(players: ['Engelbert']) }
      context 'when the player has chosen a weapon' do
        before { subject.player_weapon = 'rock' }
        it 'returns false' do
          expect(subject.pending_weapon_choice?).to eq false
        end
      end
    end
  end
end