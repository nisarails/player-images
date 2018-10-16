class UploadsController < ApplicationController

  def index
    @upload = Upload.new
  end

  def create
    redirect_to root_path, flash: {notice: "Please select image"} and return unless params[:upload].present?
    params[:upload][:file].each do |upload_file|
      Upload.create(file: upload_file)
    end
    redirect_to root_path, flash: {notice: "Uploaded."}
  end

end
