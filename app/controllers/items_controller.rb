class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show]#, :edit, :update, :destroy]
  #before_action :set_login, only: [:edit,:update,:destroy]
  def index
    @items = Item.all.order(created_at: "DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  #def edit
  #  if @item.order != nil
  #    return redirect_to root_path
  #  end
  #end

  #def update
  #  if @item.update(item_params)
  #    redirect_to action: :show
  #  else
  #    render :edit
  #  end
  #end

  #def destroy
  #  @item.destroy
  #  redirect_to action: :index
  #end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :text, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price, :image
    ).merge(user_id: current_user.id)
    
  end

  #def set_login
  #  redirect_to action: :index unless current_user.id == @item.user_id
  #end 
end


