class Apartment < ApplicationRecord
    validates :number, numericality: true
    has_many :leases, dependent: :destroy
    has_many :tenants, through: :leases
end
