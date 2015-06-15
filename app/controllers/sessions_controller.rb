class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:sessions][:email])
    if user && user.authenticate(params[:sessions][:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome #{user.username}!"
      redirect_to job_index_path
    else
      flash[:errors] = "Invalid Login"
      redirect_to :back
    end
  end
end
