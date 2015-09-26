class GameStat < ActiveRecord::Base

  def self.init_new_game(game)

    for tb in ['top', 'bottom']
      # hitting
      for i in 1..9
        gs = self.new

        gs.game_id    = game.id
        gs.team_id    = game[tb + '_team_id']
        gs.stats_type = 'hitting'
        gs.order      = i

        gs.save
      end

      # pitching
      gs = self.new
      gs.game_id = game.id
      gs.team_id = game[tb + '_team_id']
      gs.stats_type = 'pitching'
      gs.order = 1
      gs.save
    end

    return true
  end
end
