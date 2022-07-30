class Public::AddressesController < ApplicationController
  
  def index
   @addresses=Address.all
  end  

  def create
  end
  
  def edit
  end
  
  def update
  end
  
  private
  
  def adress_params
    params.require(:adress).permit(:)

end
