# -*- encoding : utf-8 -*-
class Cms::AnglesController < Cms::BaseController
  before_action :find_vehicle, only: [:new, :create]
  
  def index
    @angles = Angle.page(params[:page])
  end
  
  def show
    @angle = Angle.find(params[:id])
  end
  
  def new
    @angle = Angle.new
  end
  
  def edit
    @angle = Angle.find(params[:id])
  end
  
  def create
    @angle = @vehicle.angles.new(angle_params)
    if @angle.save
      redirect_to [:cms, @angle], notice: '创建成功！'
    else
      render action: 'new'
    end
  end
  
  def update
    @angle = Angle.find(params[:id])
    if @angle.update_attributes(angle_params)
      redirect_to [:cms, @angle], notice: '更新成功！'
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @angle = Angle.find(params[:id])
    @angle.destroy
    redirect_to [:cms, @angle.vehicle]
  end

  protected
  def angle_params
    params.require(:angle).permit!
  end

  def find_vehicle
    @vehicle = Vehicle.find(params[:vehicle_id])
  end
end
