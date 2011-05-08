class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
        @title = @user.name
    end

  def new
    @title = "Sign up"
    @user = User.new
  end
    
    def create
        @user = User.new(params[:user])
        if @user.save
            # udalo sie zapisac usera do bazy
            # logujemy usera po tym jak udalo sie go zapisac do bazy
            sign_in @user
            # flash na nowej stronie z przywitaniem usera
            flash[:success] = "Witaj " + @user.name 
            redirect_to user_path(@user) 
            # rownie dobrze redirect_to @user bedzie dzialac
        else
            @title = 'Sign up'  
            render 'new'
        end
    end
  def edit
    @user = User.find(params[:id])
    @title = 'Edytuj swoje dane'
  end
  
end
