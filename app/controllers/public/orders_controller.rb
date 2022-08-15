class Public::OrdersController < ApplicationController
   before_action :authenticate_customer!
  
  def new
    @order=Order.new
    @addresses=current_customer.addresses
  end   
  
  def create
    @order=Order.new(order_params)
    @order.customer_id=current_customer.id
    @order.order_status=0
    @order.postage=800
    @order.save
    
    
    @cart_items=current_customer.cart_items
    @cart_items.each do |cart_item|
    @order_detail=OrderDetail.new 
    #order_detailsの中にある各カラムが何かを記述する。
    @order_detail.order_id=@order.id
    @order_detail.item_id=cart_item.item_id
    @order_detail.quantity=cart_item.amount
    @order_detail.purchase_price=cart_item.item.with_tax_price
    @order_detail.manufacture_status=0
    @order_detail.save
    end     
    
    @cart_items.destroy_all
    redirect_to public_orders_complete_path
  end 
  
  
  def confirm
    @order=Order.new(order_params)
    @order.postage=800
    @total=0
    @cart_items=current_customer.cart_items
    
    if params[:order][:address_option] == "my_address"
     @order.postal_code = current_customer.postal_code
     @order.address = current_customer.address
     @order.full_name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:address_option] == "registrations_address"
     @address = Address.find(params[:order][:address_id])
     @order.postal_code = @address.address
     @order.address = @address.address
     @order.full_name = @address.name
    elsif params[:order][:address_option] == "new_address"
     @order.postal_code = params[:order][:postal_code]
     @order.address = params[:order][:address]
     @order.full_name = params[:order][:name]
    end 
  end  
  
  def complete
  end       
  
  def index
    @orders=current_customer.orders  
  end 
  
  def show
    @order=Order.find(params[:id]) 
    @order_details=@order.order_details
  end  
  
  
  private

  def order_params
   params.require(:order).permit(:payment_method, :postal_code,:address,:full_name, :postage, :amount_billed)
  end

end
