class ProductsController < ApplicationController
  before_filter :authenticate_user!, :except=>'index'
  def new
     @product=Product.new
   end
   def create
    warn product_params
    product=Product.new(product_params)
    product.creater=current_user
    if product.save
     redirect_to product_path(product.id) 
    else
     flash[:error]=product.errors.values.flatten.join(",")
     redirect_to :back
    end
   end
   def show
   @product=Product.where(:id=>params.permit(:id)[:id]).first
   @images=@product.product_images
   end
   def destroy
   if  Product.destroy_all(:id=>params.permit(:id)[:id])
     flash[:success]="删除成功"
     redirect_to :back
   else
     redirct_to :back
   end
 end
  def follow
    product=Product.where(:id=>params.permit(:id)[:id]).first
    redirect_to :back if !current_user
    if product.followers.include? current_user
       product.followers.delete(current_user)
    else
       product.followers << current_user
    end
    product.save
    redirect_to :back
  end
  private
   def product_params
    params.require(:product).permit(:id,:name,:description, :product_images_attributes=>[:id,:image,:destroy], :tags_attributes=>[:id,:title,:destroy, :product_ids=>[]])
   end
end
