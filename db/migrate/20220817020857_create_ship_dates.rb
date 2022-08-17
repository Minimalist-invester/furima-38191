class CreateShipDates < ActiveRecord::Migration[6.0]
  def change
    create_table :ship_dates do |t|

      t.timestamps
    end
  end
end
