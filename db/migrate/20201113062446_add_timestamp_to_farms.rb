class AddTimestampToFarms < ActiveRecord::Migration[6.0]
  def change
    add_column :farms, :created_at, :datetime
    add_column :farms, :updated_at, :datetime
  end
end
