class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :url
      t.string :phone
      t.string :email
      t.references :contactable, polymorphic: true
    end
  end
end
