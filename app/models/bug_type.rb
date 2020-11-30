class BugType < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates_uniqueness_of :name
  has_many :farm_bug_types
  has_many :farms, through: :farm_bug_types
end