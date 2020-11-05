class CreateFarms < ActiveRecord::Migration[6.0]
  def change
    create_table :farms do |t|

      t.string :name
      t.string :website
      t.string :country
      t.text :description

    end
  end
end
