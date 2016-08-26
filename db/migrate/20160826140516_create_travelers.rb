class CreateTravelers < ActiveRecord::Migration[5.0]
  def change
    create_table :travelers do |t|
      t.string :username
      t.string :bio
      t.float :guest_expectations
      t.float :openness
      t.float :conscientiousness
      t.float :extraversion
      t.float :agreeableness
      t.float :emotional_range
      t.string :profile_link

      t.timestamps
    end
  end
end
