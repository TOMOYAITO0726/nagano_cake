class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order
  
  enum manufacture_status: {unable_making:0,waiting_making:1,making:2,finish_making:3}
  
  def subtotal
    purchase_price*quantity
  end   
  
end
