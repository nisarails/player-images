class GamesController < ApplicationController
  def index
    @uploads = Upload.all
  end

  def new
    
  end

end
