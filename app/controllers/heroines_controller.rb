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
    @heroine = Heroine.new(heroine_params)
    if @heroine.save
      redirect_to @heroine
    else
      flash.clear
      flash[:super_name_error] = @heroine.errors.messages[:super_name].first
      flash[:name_error] = @heroine.errors.messages[:name].first
      render :new
    end
  end

  private

    def heroine_params
      params.require(:heroine).permit(:name, :super_name, :power_id)
    end

end
