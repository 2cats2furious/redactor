require "orm_adapter"
require "redactor-capsens/version"

module RedactorCapsens
  IMAGE_TYPES = ['image/jpeg', 'image/png', 'image/gif', 'image/jpg', 'image/pjpeg', 'image/tiff', 'image/x-png']

  FILE_TYPES = ['application/msword', 'application/pdf', 'text/plain', 'text/rtf', 'application/vnd.ms-excel']

  autoload :Http, 'redactor-capsens/http'
  autoload :Devise, 'redactor-capsens/devise'

  module Backend
    autoload :CarrierWave, 'redactor-capsens/backend/carrierwave'
  end
  require 'redactor-capsens/orm/base'
  require 'redactor-capsens/orm/active_record'
  require 'redactor-capsens/orm/mongoid'
  require 'redactor-capsens/engine'
  require 'redactor-capsens/helper'

  mattr_accessor :image_file_types, :document_file_types
  @@image_file_types = ["jpg", "jpeg", "png", "gif", "tiff"]
  @@document_file_types = ["pdf", "doc", "docx", "xls", "xlsx", "rtf", "txt"]


  def self.picture_model
    RedactorCapsens::Picture
  end

  def self.document_model
    RedactorCapsens::Document
  end

  def self.devise_user
    %s(user)
  end

  def self.devise_user_key
    "#{self.devise_user.to_s}_id".to_sym
  end
end
