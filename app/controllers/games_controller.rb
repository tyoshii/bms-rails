class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def create
    param = params.require(:game).permit(:date, :start_time, :stadium, :memo)
    @game = Game.new(param)

    if @game.save
      redirect_to games_path
    else
      render 'new'
    end
  end

  def new
    @game = Game.new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end
end
