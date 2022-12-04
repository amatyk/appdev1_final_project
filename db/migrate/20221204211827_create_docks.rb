class CreateDocks < ActiveRecord::Migration[6.0]
  def change
    create_table :docks do |t|
      t.string :image
      t.string :address
      t.integer :owner
      t.string :price
      t.integer :dock_renters

      t.timestamps
    end
  end
end
