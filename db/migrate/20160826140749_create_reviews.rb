class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :host_id, foreign_key: true, index: true
      t.integer :traveler_id, foreign_key: true, index: true
      t.boolean :positive_review
      t.references :reviewable, polymorphic: true, index: true
      t.text :body

      t.timestamps
    end
  end
end
