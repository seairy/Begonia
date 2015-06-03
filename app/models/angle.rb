class Angle < ActiveRecord::Base
  belongs_to :vehicle
  has_many :categories
  has_many :pictures
end
