class PowersController < ApplicationController
  def index
    @powers = Power.all
  end

  def show
    @power = Power.find(params[:id])
  end

  def search
    @power = Power.find_by(name: params[:q])
    @heroines = Heroine.all.select { |heroine| heroine.power_id == @power.id }
  end

end
