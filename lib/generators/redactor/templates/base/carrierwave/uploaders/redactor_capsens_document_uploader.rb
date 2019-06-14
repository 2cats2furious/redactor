# encoding: utf-8
class RedactorCapsensDocumentUploader < CarrierWave::Uploader::Base
  include RedactorCapsens::Backend::CarrierWave

  # storage :fog
  storage :file

  def store_dir
    "system/redactor_assets/documents/#{model.id}"
  end

  def extension_white_list
    RedactorCapsens.document_file_types
  end
end
