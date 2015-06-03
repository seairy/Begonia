class VehiclesController < BaseController
  def show
    @vehicle = Vehicle.find(params[:id])
    @angle = begin
      @vehicle.angles.find(params[:angle_id])
    rescue ActiveRecord::RecordNotFound
      @vehicle.angles.first
    end
    session["vehicle_#{@vehicle.id}_angle_#{@angle.id}"] ||= Hash[@angle.categories.map{|category| [category.id.to_s, '0']}]
    @picture = @angle.pictures.find_by_equipment(session["vehicle_#{@vehicle.id}_angle_#{@angle.id}"])
  end

  def reset
    @vehicle = Vehicle.find(params[:id])
    @angle = @vehicle.angles.find(params[:angle_id])
    session["vehicle_#{@vehicle.id}_angle_#{@angle.id}"] = Hash[@angle.categories.map{|category| [category.id.to_s, '0']}]
    redirect_to vehicle_path(@vehicle, angle_id: @angle.id)
  end
end