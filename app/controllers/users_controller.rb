class UsersController < ApplicationController

def new
@user = User.new
end

def create
  @user = User.new(user_params)
  if params[:user][:password] == params[:user][:password_confirmation] && @user.save
      session[:user_id] = @user.id
    else
      redirect_to '/users/new'
    end
  end

end
