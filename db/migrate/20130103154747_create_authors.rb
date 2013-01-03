class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.string :firstname
      t.string :email
      t.integer :lab
      t.string :password_digest

      t.timestamps
    end
  end
end
