# -*- encoding : utf-8 -*-
class Cms::CategoriesController < Cms::BaseController
  before_action :find_angle, only: [:new, :create]

  def index
    @categories = Category.page(params[:page])
  end
  
  def show
    @category = Category.find(params[:id])
  end
  
  def new
    @category = Category.new
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def create
    @category = @angle.categories.new(category_params)
    if @category.save
      redirect_to [:cms, @angle], notice: '创建成功！'
    else
      render action: 'new'
    end
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      redirect_to [:cms, @category.angle], notice: '更新成功！'
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to [:cms, @category.angle]
  end

  protected
  def category_params
    params.require(:category).permit!
  end

  def find_angle
    @angle = Angle.find(params[:angle_id])
  end
end
