class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def create
    param = params.require(:game).permit(:date, :start_time, :stadium, :memo, :top_team, :bottom_team)
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
    @game = Game.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
