class Upload < ActiveRecord::Base
  has_attached_file :file, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_presence :file
  validates_attachment_content_type :file, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  def self.create_with_file(uploads)
    return if uploads.blank?
    uploads[:file].each do |upload_file|
      Upload.create(file: upload_file)
    end
  end

end
