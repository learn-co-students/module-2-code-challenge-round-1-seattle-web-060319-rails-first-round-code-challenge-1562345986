class HeroinesController < ApplicationController
  before_action :heroine_params, only: [:create]

  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find(params[:id])
    @powers = Power.all
  end

  def new
    @heroine = Heroine.new
    @power = Power.new
  end

  def create
    @heroine = Heroine.new(heroine_params)
    @heroine.save
    redirect_to heroine_path(@heroine)
  end


private

   def heroine_params
     params.require(:heroine).permit(:name, :super_name, :power_id)
   end
end
