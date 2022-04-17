class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def Create
  end


  private

  def message_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end

end
