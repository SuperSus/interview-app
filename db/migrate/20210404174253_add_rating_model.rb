class AddRatingModel < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.integer :value,    null: false
      t.integer :movie_id
      t.integer :user_id

      t.timestamps
    end

    add_index :ratings, [:user_id, :movie_id], unique: true
  end
end
