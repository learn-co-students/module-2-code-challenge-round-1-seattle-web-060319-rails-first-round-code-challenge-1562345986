class Heroine < ApplicationRecord
  validates :super_name, uniqueness: true
    
  belongs_to :power

  def power_name
    self.power.name
  end

end
