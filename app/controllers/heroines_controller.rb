class HeroinesController < ApplicationController
  
  def index
    @heroines = Heroine.all
  end

  def search
    power = Power.find_by(:name == params[:q])
    @heroines = Heroine.all.where("power_id = ?" , power.id)
    render :index
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    flash.clear
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.save
      redirect_to @heroine
    else
      flash[:errors] = @heroine.errors.messages
      render :new
    end
  end

  private

    def heroine_params
      params.require(:heroine).permit(:name, :super_name, :power_id)
    end

end
