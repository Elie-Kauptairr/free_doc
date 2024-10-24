class City < ApplicationRecord
  belongs_to :city
  has_many :doctors
  has_many :patients
  has_many :appointments
end
