class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!

 def new
   @address=Address.new
 end
 
 def index
   @addresses=current_customer.addresses
   @address=Address.new
 end
 
 def edit
  @address=Address.find(params[:id])
 end
 
 def create
  @address=Address.new(address_params)
  @address.customer_id=current_customer.id
  @address.save
  redirect_to  public_addresses_path
 end
 
 def update
  @address=Address.find(params[:id])
  @address.update(address_params)
  redirect_to  public_addresses_path
 end
 
 def destroy
  address=Address.find(params[:id])
  address.destroy
  redirect_to '/public/addresses'
 end
 
 private
 
 def address_params
  params.require(:address).permit(:name,:postal_code,:address) 
 end   

end
