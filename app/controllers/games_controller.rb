class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update]
  before_action :validate_edit_user, only: [:edit]

  def index
    @games = Game.all
  end

  def create
    param = params.require(:game).permit(:date, :start_time, :stadium, :memo, :top_team_id, :bottom_team_id)

    # default
    param[:rs] = { top_1: '', bottom_1: '' }
    param[:last_inning] = 7

    @game = Game.new(param)

    if @game.save
      if GameStat.init_new_game(@game)
        redirect_to games_path
        return
      else
        @game.delete
      end
    end

    @teams = Team.all
    render 'new'
  end

  def new
    @game = Game.new
    @teams = Team.all
  end

  def edit
    @rs = @game.rs
    @players = {
      'top'    => Player.where('team_id = ?', @game.top_team_id),
      'bottom' => Player.where('team_id = ?', @game.bottom_team_id)
    }

    @stats = { 'top' => {}, 'bottom' => {} }
    for tb in ['top', 'bottom']
      for stats_type in ['hitting', 'pitching']
        @stats[tb][stats_type] = GameStat.where('game_id = ? AND team_id = ? AND stats_type = ?', @game.id, @game[tb + '_team_id'], stats_type)
      end
    end
  end

  def show
  end

  def update
    game_update = {rs: params[:rs], last_inning: params[:game][:last_inning]}
    @game.update(game_update)

          exit;
  end

  def destroy
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def validate_edit_user
    team1 = @game.top_team_id
    team2 = @game.bottom_team_id

    if Team.where('id = ? or id = ?', team1, team2).where('admin LIKE ?', current_user.email)
      p 'admin'
    else
      notice = 'cannot edit game'
      redirect_to games_path
    end
  end
end
