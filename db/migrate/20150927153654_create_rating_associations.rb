class CreateRatingAssociations < ActiveRecord::Migration
  def change
    create_table :rating_associations do |t|
      t.integer :rating_id
      t.integer :topic_id
      t.references :rating, index: true
      t.references :topic, index: true
      t.references :post, index: true
# #3
      t.references :rateable, polymorphic: true, index: true

      t.timestamps null: false
    end
    add_foreign_key :rating_associations, :labels
    add_foreign_key :rating_associations, :topics
    add_foreign_key :rating_associations, :posts
  end
end
