class ProductController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])

    render 'show'
  end

  def new

  end

  def edit
      @product = Product.find(params[:id])

      # render 'edit'

  end

  def create
    @product = Product.create(product_params)

  redirect_to '/product/index'
  end

  def update
    puts params[:product]
      product = Product.find(params[:id])
      product.update_attributes(product_params)
      # puts user.valid? 
      # render text: "asfjalskf"
      redirect_to "/product/index"
  end

  def destroy
  end

  def delete
    product = Product.find(params[:id]).delete

    redirect_to '/product/index'
    
  end

 private 
  def product_params
   params.require(:product).permit(:name, :description, :pricing)
  end

end
