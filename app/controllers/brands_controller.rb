class BrandsController < ApplicationController
  
  before_action :logged_in_user, only: [:edit,:destroy,:update,:new,:create]
  before_action :admin_user, only: [:edit,:destroy,:update,:new,:create]
  
  def show
    @brand = Brand.find(params[:id])
    @products = @brand.products.paginate(page: params[:page])
  end

  def new
     @brand=Brand.new
  end
  
  def update
    @brand = Brand.find_by(id: params[:id])
    #画像データが送信された場合
    if params[:image]
      #データベースに保存するファイル名はユーザーのid.jpgとする
      @brands.image_name = "#{@brand.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@brand.image_name}",image.read)
    end
  end
  
  def create
    @brand = Brand.new(brand_params)  
    if @brand.save
       flash[:success] = "追加しました"
       redirect_to @brand
    else
      render 'new'
    end
  end
  
  def index
     @brands = Brand.all
  end
  
  private
    
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    
    def brand_params
      params.require(:brand).permit(:name, :explain, :image_name)
    end
    
end
