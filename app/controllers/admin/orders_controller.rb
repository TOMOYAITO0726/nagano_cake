class Admin::OrdersController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
   @orders=Order.all  
  end 
  
  def show
   @order=Order.find(params[:id])  
   @order_details=@order.order_details
  end
  
  def update
   @order=Order.find(params[:id]) 
   @order.update(order_params)
   if @order.order_status=="confirmation"
    @order.order_details.each do |order_detail|
     order_detail.update(manufacture_status:1)
    end 

   end
   redirect_to admin_order_path(@order.id)
  end   


  def order_params
    params.require(:order).permit(:order_status)
  end 
end
