class User < ApplicationRecord
  has_many :vehicles

  validates :name, :nationality, :email, presence: true
  validates_uniqueness_of :email
end
