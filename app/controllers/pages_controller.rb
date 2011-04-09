class PagesController < ApplicationController
  
  def last
      if User.count == 0 
          'brak uzytkownikow w bazie'
      else
          User.last.name
      end
    end
  
  def home
    @title = "home"
    @users = User
    @last = last
  end

  def contact
    @title = "contact"
  end
  
  def about
    @title = "about"
  end
  
  def help
    @title = "help"
  end

end
