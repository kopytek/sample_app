class SessionsController < ApplicationController
  def new
    @title = "zaloguj sie"
  end
  
  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      # cos poszlo nie tak przy logowaniu
      flash.now[:error] = "Podales zle informacje"
      @title = 'zaloguj sie'
      render 'new'
    else
      # dane poprawne, logujemy
      sign_in user
      redirect_back_or user
    end
    
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end
end
