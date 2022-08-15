class RenameManufactureToManufactureStatus < ActiveRecord::Migration[6.1]
  def change
    rename_column :order_details, :manufacture, :manufacture_status
  end
end
