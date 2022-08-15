class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  
  def update
    @order_detail=OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    if @order_detail.manufacture_status == "making"
       @order_detail.order.update(order_status:2)
    else @order_detail.manufacture_status == "finish_making"
         @order_detail.order.update(order_status:3)
    end     
         
    redirect_to admin_order_path(@order_detail.order)
  end

  def order_detail_params
    params.require(:order_detail).permit(:manufacture_status)
  end 
  
end
