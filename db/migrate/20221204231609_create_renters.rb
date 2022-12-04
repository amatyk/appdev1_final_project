class CreateRenters < ActiveRecord::Migration[6.0]
  def change
    create_table :renters do |t|
      t.string :email
      t.string :password_digest
      t.string :renter_username
      t.text :renter_comment

      t.timestamps
    end
  end
end
