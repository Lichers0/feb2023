describe PlayerAchievementMutator do
  describe '.create' do
    subject(:run_mutator) { described_class.create(params) }

    let(:game) { create :game }
    let(:player) { create :player }
    let(:achievement) { create :achievement }

    let(:params) { { id: game.id, player_id: player.id, achievement_id: achievement.id } }

    it { expect { run_mutator }.to change(PlayerAchievement, :count).by(1) }

    context 'when game id is nil' do
      let(:params) { { id: nil, player_id: player.id, achievement_id: achievement.id } }

      it { expect { run_mutator }.to raise_exception ActiveRecord::RecordNotFound }
    end

    context 'when player id is nil' do
      let(:params) { { id: game.id, player_id: nil, achievement_id: achievement.id } }

      it { expect { run_mutator }.to raise_exception ActiveRecord::RecordNotFound }
    end
    context 'when achievement id is nil' do
      let(:params) { { id: game.id, player_id: player.id, achievement_id: nil } }

      it { expect { run_mutator }.to raise_exception ActiveRecord::RecordNotFound }
    end
  end
end
