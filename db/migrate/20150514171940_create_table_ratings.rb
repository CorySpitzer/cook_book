class CreateTableRatings < ActiveRecord::Migration
  def change
    create_table(:ratings) do |t|
      t.column(:recipe_id, :integer)
      t.column(:rating, :integer)

      t.timestamps
    end

    remove_column(:recipes, :rating, :integer)
  end
end
