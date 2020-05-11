class ProductsController < ApplicationController
    
  before_action :logged_in_user, only: [:edit,:destroy,:update,:new,:create]
  before_action :admin_user, only: [:edit,:destroy,:update,:new,:create]
  
  def show
    @micropost=Micropost.new
    @product = Product.find(params[:id])
    @microposts=@product.microposts.paginate(page: params[:page])
    @brand=Brand.find_by(id: @product.brand_id)
  end

  def new
    @product=Product.new
  end
  
  def update
    @product= Product.find_by(id: params[:id])
    #画像データが送信された場合
    if params[:image]
      #データベースに保存するファイル名はユーザーのid.jpgとする
      @product.image_name = "#{@product.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@product.image_name}",image.read)
    end
  end
  
  def create
    @product = Product.new(product_params)  
    if @product.save
       flash[:success] = "追加しました"
       redirect_to @product
    else
      render 'new'
    end
  end
  
  def index
     @products = Product.all
  end
  
  private
    
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    
    def product_params
      params.require(:product).permit(:name,:category,:price,:brand_id, :explain, :image_name)
    end
    
end
