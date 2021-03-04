class Vehicle < ApplicationRecord

    # Has Many / Belongs To
    has_many :cars
    has_many :users, through: :cars

    # Validations
    validates :name, :presence => true
end
