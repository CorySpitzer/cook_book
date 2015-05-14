class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:categories)
  has_and_belongs_to_many(:ingredients)
  has_many(:ratings)
  validates(:name, presence: true)
  validates(:instructions, presence: true)
  scope(:sort_by_rating, -> do
    order(mean_rating: :desc)
  end)


end
