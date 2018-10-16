class UploadsController < ApplicationController

  def index
    @upload = Upload.new
  end

  def create
    redirect_to root_path, flash: {notice: "Please select image"} and return unless params[:upload].present?
    Upload.create_with_file(upload_params)
    redirect_to root_path, flash: {notice: "Uploaded."}
  end

  private

  def upload_params
    params.require(:upload).permit(file: [])
  end

end
