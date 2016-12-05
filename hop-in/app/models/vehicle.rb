class Vehicle < ApplicationRecord
	has_many :reservations
	has_many :passengers, class_name: 'User', source: :user, through: :reservations
	belongs_to :owner, class_name: 'User', source: :user

	validates_presence_of :vehicle_year, :vehicle_make, :vehicle_model, :street_address, :city, :province, :postal_code
end
