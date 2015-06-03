class Picture < ActiveRecord::Base
  mount_uploader :file, BaseUploader
  belongs_to :angle
  validates :code, uniqueness: true

  def code= equipment_params
    write_attribute(:code, equipment_params.map do |category_id, equipment_id|
      "#{category_id}=#{equipment_id}"
    end.join('|'))
  end

  def hashed_code
    Hash[read_attribute(:code).split('|').map do |category_and_equipment|
      [category_and_equipment.split('=')[0], category_and_equipment.split('=')[1]]
    end]
  end

  def human_code
    hashed_code.map do |category_id, equipment_id|
      category_name = Category.find(category_id).name
      equipment_name = begin
        Equipment.find(equipment_id).name
      rescue ActiveRecord::RecordNotFound => e
        '无'
      end
      "#{category_name}： #{equipment_name}"
    end
  end

  class << self
    def find_by_equipment hash
      all.select do |picture|
        picture.hashed_code.all?{|k, v| hash[k] == v}
      end.first
    end
  end
end
