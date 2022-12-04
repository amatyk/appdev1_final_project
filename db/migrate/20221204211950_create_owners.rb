class CreateOwners < ActiveRecord::Migration[6.0]
  def change
    create_table :owners do |t|
      t.string :email
      t.string :password_digest
      t.string :owner_username

      t.timestamps
    end
  end
end
