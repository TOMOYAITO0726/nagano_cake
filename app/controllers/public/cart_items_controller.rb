class Public::CartItemsController < ApplicationController
  
  def index
    @cart_items=current_customer.cart_items
    @subtotal=0
    
  end 
    
  def update
    @cart_item=CartItem.find(params[:id])
    @cart_item.update(amount: params[:cart_item][:amount])
    redirect_to public_cart_items_path(@cart_item.id)
  end  
  
  def create
    
  # カートに商品が入っているか確認している
   @cart_item=current_customer.cart_items.find_by(item_id:params[:cart_item][:item_id])
# @cart_item_oldが存在する場合は数を追加する
   if @cart_item
    @cart_item.amount+=params[:cart_item][:amount].to_i
    #@cart_item.amount = @cart_item.amount + cart_item_old.amount
   else
    @cart_item=CartItem.new(cart_item_params)
    @cart_item.customer_id=current_customer.id 
   end
    @cart_item.save!
    redirect_to public_cart_items_path
    # 数を変更する
#  @cart_item_oldが存在しない場合は今まで通りのcreateをする
  end
   
  def destroy
    cart_item=CartItem.find(params[:id])
    cart_item.destroy
    redirect_to public_cart_items_path
  end
  
  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to public_cart_items_path
  end       
      
  
   private
   
   def cart_item_params
     params.require(:cart_item).permit(:customer_id, :item_id, :amount)
   end    
   
end 