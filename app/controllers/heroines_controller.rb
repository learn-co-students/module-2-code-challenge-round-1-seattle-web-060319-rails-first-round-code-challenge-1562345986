class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(params.require(:heroine).permit(:name, :super_name, :power_id))
    # flash.clear
    if @heroine.save
      redirect_to @heroine
    else
      # flash[:error_message] = "Please try again"
      render :new
    end
  end

  


end
