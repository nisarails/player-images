class GamesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :new

  def index
    @uploads = Upload.all
    @plays = Play.all
  end

  def new
    play =  Play.new(path: params[:path], counter: params[:count])
    play.save
    @plays = Play.all
  end

end
