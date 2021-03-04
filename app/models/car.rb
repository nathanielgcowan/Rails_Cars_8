class Car < ApplicationRecord

    # Has Many / Belongs To
    has_many :parts
    has_many :users, through: :parts
    belongs_to :user
    belongs_to :vehicle

    # Nested Attributes
    accepts_nested_attributes_for :parts, allow_destroy: true

    # Validations
    validates :make, length: {minimum: 1}
    validates :model, :presence => true
    validates :model, :presence => true
    validates :year, :presence => true
    validates :rating, :presence => true
    validates_inclusion_of :year, :in => 1900..2021
    validates_inclusion_of :rating, :in => 1..5


    # Scope Methods
    scope :good_car, ->{where("rating >= 4")}
    scope :good_new_cars, -> {new_car.where("rating >= 4")}
    scope :good_old_cars, -> {old_car.where("rating >= 4")}
    scope :best_cars, -> {car.where("rating >= 4")}
    scope :best_vans, -> {van.where("rating >= 4")}
    scope :best_trucks, -> {truck.where("rating >= 4")}
    scope :good_and_new, -> {new_car.where("rating >= 4")}

    # Class Methods
    def self.new_car
        where("year > 1996")
    end
    def self.old_car
        where("year < 1996 ")
    end
    def self.car
        where("vehicle_id == 1")
    end
    def self.van
        where("vehicle_id == 3")
    end
    def self.truck
        where("vehicle_id == 2")
    end

    # Display Vehicle Name
    def vehicle_name=(name)
        self.vehicle = Vehicle.find_or_create_by(name: name)
    end
        
    def vehicle_name
        self.vehicle ? self.vehicle.name : nil
    end

end
