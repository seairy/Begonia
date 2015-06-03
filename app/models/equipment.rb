class Equipment < ActiveRecord::Base
  mount_uploader :image, BaseUploader
  belongs_to :category
end
