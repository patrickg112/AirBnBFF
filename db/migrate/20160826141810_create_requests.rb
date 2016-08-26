class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.integer :host_id
      t.integer :traveler_id
      t.boolean :compatible

      t.timestamps
    end
  end
end
