class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
    t.string :postal_code, null: false
    t.string :address, null: false
    t.string :full_name, null: false
    t.integer :postage, null: false
    t.integer :amount_billed, null: false
    t.integer :payment_method, null: false
    t.integer :order_status, null: false
    t.timestamps
    end
  end
end
