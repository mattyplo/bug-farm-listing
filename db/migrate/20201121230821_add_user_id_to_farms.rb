class AddUserIdToFarms < ActiveRecord::Migration[6.0]
  def change
    add_column :farms, :user_id, :int
  end
end
