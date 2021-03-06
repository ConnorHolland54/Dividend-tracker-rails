class SessionsController < ApplicationController
  def new
  end

  def create
    return redirect_to '/login' if !params[:email] || params[:email].empty?
    user = User.find_by(email: params[:email])
    user = user.try(:authenticate, params[:password])
    return redirect_to '/login' unless user
    session[:user_id] = user.id
    @user = user
    redirect_to portfolios_path
  end

  def destroy
    session.delete :user_id
    redirect_to '/login'
  end


end
