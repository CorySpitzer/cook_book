class AddInitialTablesAndColumns < ActiveRecord::Migration
  def change
    create_table(:categories) do |t|
      t.column(:name, :string)

      t.timestamps()
    end

    create_table(:categories_recipes) do |t|
      t.column(:category_id, :integer)
      t.column(:recipe_id, :integer)

      t.timestamps()
    end

    create_table(:recipes) do |t|
      t.column(:name, :string)
      t.column(:rating, :integer)
      t.column(:instructions, :string)

      t.timestamps()
    end

    create_table(:ingredients_recipes) do |t|
      t.column(:ingredient_id, :integer)
      t.column(:recipe_id, :integer)
    end

    create_table(:ingredients) do |t|
      t.column(:name, :string)

      t.timestamps()
    end
  end
end
