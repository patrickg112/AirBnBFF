class CreateTravelers < ActiveRecord::Migration[5.0]
  def change
    create_table :travelers do |t|
      t.string :username
      t.string :bio
      t.integer :guest_wishes
      t.integer :openness
      t.integer :conscientiousness
      t.integer :extraversion
      t.integer :agreeableness
      t.integer :emotional_range
      t.string :profile_link
      
      t.timestamps
    end
  end
end
