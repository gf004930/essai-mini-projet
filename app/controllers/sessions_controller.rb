class SessionsController < ApplicationController

  def new
  end

  def create
    author = Author.find_by_email(params[:session][:email].downcase)
    if author && author.authenticate(params[:session][:password])
      redirect_to author
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  end
end
