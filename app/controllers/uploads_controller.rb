class UploadsController < ApplicationController

  def index
    @upload = Upload.new
  end

  def create
    #redirect_to uploads_path if params[:upload].&[:file].nil?
    params[:upload][:file].each do |upload_file|
      Upload.create(file: upload_file)
    end
    redirect_to root_path
  end

end
