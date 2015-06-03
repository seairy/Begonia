# -*- encoding : utf-8 -*-
class Cms::EquipmentController < Cms::BaseController
  before_action :find_category, only: [:new, :create]
  
  def index
    @equipment_list = Equipment.page(params[:page])
  end
  
  def show
    @equipment = Equipment.find(params[:id])
  end
  
  def new
    @equipment = Equipment.new
  end
  
  def edit
    @equipment = Equipment.find(params[:id])
  end
  
  def create
    @equipment = @category.equipment.new(equipment_params)
    if @equipment.save
      redirect_to [:cms, @equipment], notice: '创建成功！'
    else
      render action: 'new'
    end
  end
  
  def update
    @equipment = Equipment.find(params[:id])
    if @equipment.update_attributes(equipment_params)
      redirect_to [:cms, @equipment], notice: '更新成功！'
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @equipment = Equipment.find(params[:id])
    @equipment.destroy
    redirect_to admin_equipments_path
  end

  protected
  def equipment_params
    params.require(:equipment).permit!
  end

  def find_category
    @category = Category.find(params[:category_id])
  end
end