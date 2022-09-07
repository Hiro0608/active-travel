class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.text :text
      t.datetime :start_time,       null:false
      t.string :price
      t.integer :medical_category_id,      null: false
      t.references :user,    null:false, foreign_key: true
      t.timestamps
      t.timestamps
    end
  end
end
