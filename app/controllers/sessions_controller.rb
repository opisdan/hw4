class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({"username" => params["username"]})
    if @user 
      if BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        flash["notice"] = "Welcome."
    redirect_to "/places"
      else 
        flash["notice"] = "Username or Password is not valid"
        redirect_to "/sessions/new"
      end
    else
      flash["notice"] = "Username or Password is not valid"
    redirect_to "/sessions/new"
    end
  end

  def destroy
    session["user_id"] = nil
    redirect_to "/"
  end
end
  