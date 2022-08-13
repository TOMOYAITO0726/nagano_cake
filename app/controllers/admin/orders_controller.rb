class Admin::OrdersController < ApplicationController
  
  def index
   @orders=Order.all  
  end 
  
  def show
   @order=Order.find(params[:id])  
   @order_details=@order.order_details
  end
  
  def update
   @order=Order.find(params[:id])  
  end   

end
