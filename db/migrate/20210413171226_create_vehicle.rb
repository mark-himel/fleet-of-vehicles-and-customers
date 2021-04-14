class CreateVehicle < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :model, null: false, index: true
      t.integer :year, null: false
      t.bigint :chassis_number, null: false, unique: true
      t.string :color, null: false
      t.date :registration_date, null: false
      t.bigint :odometer_reading, null: false
      t.belongs_to :user, null: false, index: true
    end
  end
end
