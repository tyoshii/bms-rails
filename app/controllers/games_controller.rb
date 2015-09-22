class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit]
  before_action :validate_edit_user, only: [:edit]

  def index
    @games = Game.all
  end

  def create
    param = params.require(:game).permit(:date, :start_time, :stadium, :memo, :top_team_id, :bottom_team_id)
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
  end

  def show
  end

  def update
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
