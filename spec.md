# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
        * I used Ruby on Rails

- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
        * User has_many :Cars
        * User has_many :parts
        * Car has_many :parts
        * Vehicle has_many :Cars

- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
        * Car belongs_to :user
        * Car belongs_to :vehicle
        * Part belongs_to :car
        * Part belongs_to :user

- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
        * User has_many :parted_cars, through: :parts
        * User has_many :vehicles, through: :cars
        * Car has_many :users, through: :parts
        * Vehicle has_many :users, through: :cars

- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
        * User has_many :parted_cars, through: :parts | Car has_many :users, through: :parts
        * User has_many :vehicles, through: :cars | Vehicle has_many :users, through: :cars

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
        * Part.name, Part.rating
        * Car.make, Car.model, Car.year, Car.rating

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    * User
        * validates :email, uniqueness: true
        * validates :name, :login, :email, presence: true
    * Car
        * validates :make, length: {minimum: 1}
        * validates :model, :presence => true
        * validates :model, :presence => true
        * validates :year, :presence => true
        * validates :rating, :presence => true
        * validates_inclusion_of :year, :in => 1900..2021
        * validates_inclusion_of :rating, :in => 1..5
    * Part
        * validates :name, :presence => true
        * validates :rating, presence: true, numericality: { only_integer: true }
        * validates_inclusion_of :rating, :in => 1..5
    * Vehicle
        * validates :name, :presence => true

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
        1) Model object 2) Class Method Name    3)URL to see the working feature
        * Car.good_new_cars   1) year 2) self.new_car 3) /cars/ratings
        * Car.good_old_cars   1) year 2) self.old_car 3) /cars/ratings
        * Car.best_cars       1) vehicle_id 2) self.car 3) /cars/ratings
        * Car.best_vans       1) vehicle_id 2) self.van  3) /cars/ratings
        * Car.best_trucks     1) vehicle_id 2) self.truck 3) /cars/ratings
- [x] Include signup (how e.g. Devise)
        * Yes, you can signup with Devise
- [x] Include login (how e.g. Devise)
        * Yes, you can login with Devise
- [x] Include logout (how e.g. Devise)
        * Yes, you can logout with Devise
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
        * Yes, there is third party signup/login with Devise/OmniAuth
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
        * /cars/10/parts
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
        * /cars/10/parts/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
        * Car and Part have this
        ```
            <% if @car.errors.any? %>
                        * <div id="error_explanation">
                        <h2>
                                <%= pluralize(@car.errors.count, "error") %>
                                prohibited this post from being saved:
                        </h2>
                        
                        <ul>
                                <% @car.errors.full_messages.each do |msg| %>
                                <li><%= msg %></li>
                                <% end %>
                        </ul>
                        </div>
                <% end %>
        ```
        * User is Devise
        * I took out the new vehicle route to prevent invalid data.
Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
