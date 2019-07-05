class HeroinesController < ApplicationController
  def index
    if params.has_key?("q")
      @search = true
    else
      @search = false
    end
    @heroines = Heroine.all
    @search_results = search(params)
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
      render :new
    end
  end

  def edit
  end

  def update
  end


  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

   def search(params)
    if params.has_key?("q")
      query = params[:q]
      return Heroine.all.select do |heroine|
        heroine.power.name == query
      end
    else
      return []
    end
  end


end
