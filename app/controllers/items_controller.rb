class ItemsController < ApplicationController
  before_action :logged_in_user, only: [:edit,:destroy,:update,:new,:create]
  before_action :admin_user, only: [:edit,:destroy,:update,:new,:create]
  
  def show
    @item = Item.find(params[:id])
  end

  def new
     @item=Item.new
  end
  
  
  def create
    @item = Item.new(item_params)  
    if @item.save
       flash[:success] = "追加しました"
       redirect_to @item
    else
      render 'new'
    end
  end
  
  def index
     @items = Item.all
  end
  
  private
    
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    
    def brand_params
      params.require(:item).permit(:name,:category, :explain,:price,:brand_id, :image_name)
    end
    
end
