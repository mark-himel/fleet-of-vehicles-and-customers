class Vehicle < ApplicationRecord
  belongs_to :user

  validates :model, :year, :chassis_number, :color,
            :registration_date, :odometer_reading, presence: true
  validates_uniqueness_of :chassis_number

  def self.search(search)
    if search
      matched_customer = joins(:user).where('users.name LIKE ?', "%#{search}%")
      matched_vehicles = joins(:user).where('model LIKE ?', "%#{search}%")
      matched_customer.or(matched_vehicles)
    else
      all
    end
  end
end
