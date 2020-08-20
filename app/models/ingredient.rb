class Ingredient < ApplicationRecord
  has_many :doses
  has_many :cocktails, through: :doses
  # belongs_to :cocktail, through: :doses
  validates :name, presence: true, uniqueness: true

end
