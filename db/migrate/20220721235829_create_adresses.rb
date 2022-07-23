class CreateAdresses < ActiveRecord::Migration[6.1]
  def change
    create_table :adresses do |t|
      t.string :name, null: false
      t.string  :postal_code, null: false
      t.string :adresses, null: false
      t.timestamps
    end
  end
end
