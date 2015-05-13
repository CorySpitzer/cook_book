class FixCategoriesRecipes < ActiveRecord::Migration
  def change
    drop_table(:categories_recipes)
    create_join_table(:categories, :recipes)
  end
end
