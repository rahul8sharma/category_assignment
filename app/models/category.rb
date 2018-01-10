class Category < ApplicationRecord
  # associations
  belongs_to :parent_categories, class_name: 'Category', foreign_key: 'parent_id', required: false
  has_many :sub_categories, class_name: 'Category', foreign_key: 'parent_id', dependent: :destroy

  # validations
  validates :name, presence: true, length: { maximum: 20 }
end
