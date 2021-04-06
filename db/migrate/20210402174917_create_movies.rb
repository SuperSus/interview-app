class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title,         null: false, default: ''
      t.text :text,            null: false, default: ''
      t.float :avg_rating,     null: false, default: 0.0
      t.integer :category,     null: false, default: 0

      t.timestamps
    end
  end
end
