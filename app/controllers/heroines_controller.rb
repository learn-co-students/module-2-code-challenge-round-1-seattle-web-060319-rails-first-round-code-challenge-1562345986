class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def new 
    @heroine = Heroine.new 
    @powers = Power.all
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def create
    @heroine = Heroine.new(heroine_params(:name, :super_name, :power_id))
    if @heroine.save 
      redirect_to heroine_path(@heroine)
    else
      render :new
    end
  end

  def edit 
    @heroine = Heroine.find(params[:id])
    @powers = Power.all 
  end

  def update
    @heroine = Heroine.find(params[:id])
    if @heroine.update(heroine_params(:name, :super_name, :power_id))
      redirect_to heroine_path(@heroine)
    else
      errors.message("can't be duplicate super name")
      render :edit 
    end
  end


  private 
    def heroine_params(*args)
      params.require(:heroine).permit(*args)
    end

end
