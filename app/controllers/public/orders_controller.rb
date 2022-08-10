class Public::OrdersController < ApplicationController
  
  def new
    @order=Order.new
  end   
  
  def create
    @order=current_customer.orders.new(order_params)
    @order.save
    redirect_to public_orders_confirm_path 
  end 
  
  def confirm
    @order=Order.new(order_params)
    @cart_items=current_customer.cart_items
    if params[:order][:address_option] == "my_address"
     @order.postal_code = current_customer.postal_code
     @order.address = current_customer.address
     @order.full_name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:address_option] == "registrations_address"
     @address = Address.find(params[:order][:address_id])
     @order.postal_code = @address.address
     @order.address = @address.address
     @order.full_name = @address.mname
    elsif params[:order][:address_option] == "new_address"
     @order.postal_code = params[:order][:postal_code]
     @order.address = params[:order][:address]
     @order.full_name = params[:order][:name]
    end 
        
    
  end  
  
  def index
  end 
  
  def show
  end  
  
  
  private
  
  
  
  def order_params
   params.require(:order).permit(:payment_method, :postal_code,:address,:full_name)
  end

end
