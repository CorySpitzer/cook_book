class Rating < ActiveRecord::Base
  belongs_to(:recipe)
  validates(:value, inclusion: {in: 0..5}, numericality: {only_integer: true})
  after_save(:update_recipe_mean_rating)

private
  def update_recipe_mean_rating
    recipe = Recipe.find(recipe_id)
    recipe.update(mean_rating: Rating.where(recipe_id: recipe_id).average("value"))
  end
end
