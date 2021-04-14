FactoryBot.define do
  factory :vehicle do
    association :user, factory: :user
    model { 'Ferrari' }
    year { 2012 }
    chassis_number { 123456 }
    color { 'Black' }
    registration_date { 10.year.ago.to_date }
    odometer_reading { 23456 }
  end
end
