class CreateFarmBugTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :farm_bug_types do |t|
      t.integer :farm_id
      t.integer :bug_type_id
    end
  end
end
