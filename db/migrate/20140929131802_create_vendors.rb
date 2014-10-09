class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.decimal :lat, { precision: 10, scale: 6 }
      t.decimal :lon, { precision: 10, scale: 6 }

      t.timestamps
    end
  end
end
