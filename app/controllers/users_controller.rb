class UsersController < ApplicationController

def new
@user = User.new
end

def show
  @user = user
end 

def create
  @user = User.new(user_params)
  if params[:user][:password] == params[:user][:password_confirmation] && @user.save
      session[:user_id] = @user.id
      redirect_to '/users/show'
    else
      redirect_to '/users/new'
    end
  end


private


def user_params
  params.require(:user).permit(:name, :password, :password_confirmation)
end
end
