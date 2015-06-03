# -*- encoding : utf-8 -*-
class Cms::PicturesController < Cms::BaseController
  before_action :find_angle, only: [:new, :create]
  
  def index
    @pictures = Picture.page(params[:page])
  end
  
  def show
    @picture = Picture.find(params[:id])
  end
  
  def new
    @picture = Picture.new
  end
  
  def edit
    @picture = Picture.find(params[:id])
  end
  
  def create
    @picture = @angle.pictures.new(picture_params)
    @picture.code = equipment_params
    if @picture.save
      redirect_to [:cms, @angle], notice: '创建成功！'
    else
      render action: 'new'
    end
  end
  
  def update
    @picture = Picture.find(params[:id])
    @picture.code = equipment_params
    if @picture.update(picture_params)
      redirect_to [:cms, @picture.angle], notice: '更新成功！'
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to @picture.vehicle
  end

  protected
  def picture_params
    begin
      params.require(:picture).permit!
    rescue ActionController::ParameterMissing
      {}
    end
  end

  def equipment_params
    params.require(:equipment).permit!
  end

  def find_angle
    @angle = Angle.find(params[:angle_id])
  end
end
