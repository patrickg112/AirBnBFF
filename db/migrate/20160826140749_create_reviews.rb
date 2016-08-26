class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :host_id
      t.integer :traveler_id
      t.boolean :positive_review
      t.text :body

      t.timestamps
    end
  end
end
