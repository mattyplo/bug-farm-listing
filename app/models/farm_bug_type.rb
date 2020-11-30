class FarmBugType < ApplicationRecord
  belongs_to :farm
  belongs_to :bug_type
end