class CreateAverageRatingColumnInRecipe < ActiveRecord::Migration
  def change
    add_column(:recipes, :mean_rating, :float)
  end
end
