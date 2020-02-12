class SessionsController < ApplicationController
  def new
     if is_logged_in?
       redirect_to current_user
     else
       render 'new'
     end
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]

    user = User.find_by(email: email)
    if user && user.authenticate(password)
      login(user)
      redirect_to user
    else
      flash.now[:danger] = "Invalid email/password"
      render 'new', notice: "Invalid email/password"
    end
  end
end
