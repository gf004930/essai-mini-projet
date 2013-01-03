class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :title
      t.string :type
      t.string :name
      t.integer :year
      t.integer :month
      t.integer :pages
      t.integer :grade
      t.references :author

      t.timestamps
    end
    add_index :publications, :author_id
  end
end
