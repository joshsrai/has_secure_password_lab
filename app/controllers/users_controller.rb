class UsersController < ApplicationController
  def home
  end

  def new
  end

  def create
      user = User.new(user_params)
      if user.save
          session[:user_id] = User.last.id
      else
         redirect_to new_user_path
      end
  end

    private

  def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
# Create a Users controller.
# It should respond to #new with the signup form,
# and respond to #create by creating a new user.