class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :nationality, null: false
      t.string :email, null: false, unique: true, index: true
    end
  end
end
