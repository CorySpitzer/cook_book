class ConnectJoinTables < ActiveRecord::Migration
  def change
    # remove_column(:categories_recipes, :category_id, :integer)
    # remove_column(:categories_recipes, :recipe_id, :integer)
    #
    # remove_column(:ingredients_recipes, :recipe_id, :integer)
    # remove_column(:ingredients_recipes, :ingredient_id, :integer)
    #
    drop_table(:categories_recipes)
    drop_table(:ingredients_recipes)

    create_table(:categories_recipes, id: false) do |t|
      t.belongs_to(:categories, index: true)
      t.belongs_to(:recipes, index: true)
    end
    # which is basically the same as
    create_join_table(:ingredients, :recipes)
  end
end
