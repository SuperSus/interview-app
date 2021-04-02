class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :text
      t.float :ratings
      t.integer :category

      t.timestamps
    end
  end
end
