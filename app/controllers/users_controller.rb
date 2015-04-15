class UsersController < ApplicationController
  def edit
  end
  def update
   @user=User.where(id: user_params[:id]).first
   @user.name=user_params[:name]
   @user.qqnumber=user_params[:qqnumber]
   @user.telnumber=user_params[:telnumber]
   redirect_to root_path if @user.update
  end
  def followlist
    @products=current_user.my_follows 
  end
  def productlist
    @products=current_user.my_products
  end
 private
   def user_params
    params.require(:user).permit(:id,:email,:name,:qqnumber,:telnumber)
   end
end
