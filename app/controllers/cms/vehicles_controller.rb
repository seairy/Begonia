# -*- encoding : utf-8 -*-
class Cms::VehiclesController < Cms::BaseController
  
  def index
    @vehicles = Vehicle.page(params[:page])
  end
  
  def show
    @vehicle = Vehicle.find(params[:id])
  end
  
  def new
    @vehicle = Vehicle.new
  end
  
  def edit
    @vehicle = Vehicle.find(params[:id])
  end
  
  def create
    @vehicle = Vehicle.new(vehicle_params)
    if @vehicle.save
      redirect_to [:cms, @vehicle], notice: '创建成功！'
    else
      render action: 'new'
    end
  end
  
  def update
    @vehicle = Vehicle.find(params[:id])
    if @vehicle.update_attributes(vehicle_params)
      redirect_to [:cms, @vehicle], notice: '更新成功！'
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy
    redirect_to admin_vehicles_path
  end

  protected
  def vehicle_params
    params.require(:vehicle).permit!
  end
end
