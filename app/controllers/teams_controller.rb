# encoding: utf-8

# teams controller
class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def create
    param = params.require(:team).permit(:name)
    @team = Team.new(param)

    if @team.save
      redirect_to teams_url
    else
      render 'new'
    end
  end

  def new
    @team = Team.new
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
