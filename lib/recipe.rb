class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:categories)
  has_and_belongs_to_many(:ingredients)
  has_many(:ratings)

  # def average_rating
  #     sum = 0
  #     self.ratings.each do |rating|
  #       sum += rating.rating
  #     end
  #     sum.to_f/Rating.count(recipe_id: self.id)
  # end

  def average_rating
    Rating.where(recipe_id: id).average("value")
  end
end
