class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :author
      t.text :summary
      t.text :description
      t.timestamps
    end
  end
end
