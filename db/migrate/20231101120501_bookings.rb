class Bookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :start_dates
      t.date :end_dates
      t.integer :price
      t.integer :number_of_customers
      t.references :user, null: false, foreign_key: true
      t.references :island, null: false, foreign_key: true
      t.timestamps
    end
  end
end
