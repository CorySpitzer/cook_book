class Rating < ActiveRecord::Base
  belongs_to(:recipe)
  validates(:value, inclusion: {in: 0..5}, numericality: {only_integer: true})

end
