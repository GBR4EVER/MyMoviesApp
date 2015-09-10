class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :moviename
      t.string :genre
      t.timestamps
    end
  end
end
