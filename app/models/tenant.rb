class Tenant < ApplicationRecord
    validates :name, presence: true
    validates :age, inclusion: 18..100

    has_many :leases, dependent: :destroy
    has_many :apartments, through: :leases
end
