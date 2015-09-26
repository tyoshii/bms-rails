class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update]
  before_action :validate_edit_user, only: [:edit]

  def index
    @games = Game.all
  end

  def create
    param = params.require(:game).permit(:date, :start_time, :stadium, :memo, :top_team_id, :bottom_team_id)
    param[:rs] = []
    param[:last_inning] = 7

    @game = Game.new(param)

    if @game.save
      redirect_to games_path
    else
      @teams = Team.all
      render 'new'
    end
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
