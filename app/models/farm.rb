class Farm < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  has_many :farm_bug_types
  has_many :bug_types, through: :farm_bug_types
end