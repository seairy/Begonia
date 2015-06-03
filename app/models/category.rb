class Category < ActiveRecord::Base
  belongs_to :angle
  has_many :equipment
end
