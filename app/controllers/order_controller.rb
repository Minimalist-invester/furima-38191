class OrderController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
    return redirect_to root_path if current_user.id == @item.user_id || !@item.order.nil?
  end

  def create
    
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :house_num, :building, :phone_num).
    merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end
end
