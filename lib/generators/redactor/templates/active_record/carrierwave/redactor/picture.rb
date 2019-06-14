class RedactorCapsens::Picture < RedactorCapsens::Asset
  mount_uploader :data, RedactorCapsensPictureUploader, :mount_on => :data_file_name

  def url_content
    url(:content)
  end
end
