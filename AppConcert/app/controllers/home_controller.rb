class HomeController < ApplicationController
  def index
     if current_user 
         redirect_to search_url
     end 
  end

  def new
  end
 

  def create
    user = login(params[:email], params[:password])
    if user
      redirect_back_or_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Email or password was invalid"
      render :new
    end
  end
  
  def destroy
    logout
    redirect_to root_url, :notice => "Logged out!"
  end

end