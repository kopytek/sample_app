require 'spec_helper'

describe "LayoutLinks" do
  
  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "home")
  end
  it "should have a Contact page at '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => "contact")
  end
  it "should have a About page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "about")
  end
  it "should have a Help page at '/help'" do
    get '/help'
    response.should have_selector('title', :content => "help")
  end
  it "should have a Sign up at '/signup'" do
    get '/signup'
    respons.should have_selector('title', :content => "sign up")

end
