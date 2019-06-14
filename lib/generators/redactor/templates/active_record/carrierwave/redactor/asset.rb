class RedactorCapsens::Asset < ActiveRecord::Base
  include RedactorCapsens::Orm::ActiveRecord::AssetBase
  delegate :url, :current_path, :size, :content_type, :filename, :to => :data
  validates_presence_of :data
end
