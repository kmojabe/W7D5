class Api::SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if @user
      log_in(@user)
      render 'api/users/show'
    else
      render json: ['Nope. Wrong credentials!'], status: 401
    end
  end

  def destroy
    if loggedin?
      logout
      render json: {}
    else
      render json: "You Wrong 404 Error"
    end
  end
end
