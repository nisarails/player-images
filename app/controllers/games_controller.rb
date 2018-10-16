class GamesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :new
  before_action :all_plays, only: [:index, :new]
  def index
    @uploads = Upload.all
  end

  def new
    play =  Play.new(game_params)
    play.save
  end

  private

  def game_params
    {path: params[:path], counter: params[:count]}
  end

  def all_plays
    @plays = Play.all
  end

end
