class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string      :post_code,     null: false 
      t.integer     :state_id,      null: false 
      t.string      :city,          null: false 
      t.references  :record,        null: false,foreign_key: true 
      t.string      :address,       null: false 
      t.string      :building_name
      t.string      :tel,           null: false 
      t.timestamps
    end
  end
end
