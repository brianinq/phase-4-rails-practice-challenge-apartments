class CreateLeases < ActiveRecord::Migration[6.1]
  def change
    create_table :leases do |t|
      t.integer :rent
      t.integer :apartment_id, foregn_key: true, null: false
      t.integer :tenant_id, foregn_key: true, null: false

      t.timestamps
    end
  end
end
