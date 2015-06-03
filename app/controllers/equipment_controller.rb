class EquipmentController < BaseController

  def show
    @equipment = Equipment.find(params[:id])
    render layout: false
  end

  def use
    @equipment = Equipment.find(params[:id])
    session["vehicle_#{@equipment.category.angle.vehicle.id}_angle_#{@equipment.category.angle.id}"][@equipment.category.id.to_s] = @equipment.id.to_s
    redirect_to @equipment.category.angle.vehicle
  end
end
