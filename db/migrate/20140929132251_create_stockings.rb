class CreateStockings < ActiveRecord::Migration
  def change
    create_table :stockings do |t|
      t.belongs_to :brewery
      t.belongs_to :vendor
      t.timestamps
    end
  end
end
