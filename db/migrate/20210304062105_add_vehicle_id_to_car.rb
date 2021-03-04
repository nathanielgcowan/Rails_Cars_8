class AddVehicleIdToCar < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :vehicle_id, :integer
  end
end
