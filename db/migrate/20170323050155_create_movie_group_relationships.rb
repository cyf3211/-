class CreateMovieGroupRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :movie_group_relationships do |t|
      t.integer :movie_group_id
      t.integer :user_id

      t.timestamps
    end
  end
end
