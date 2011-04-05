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
  #it "should have a Sign up at '/signup'" do
  #  get '/signup'
  #  response.should have_selector('title', :content => "sign up")
  #end
  it "should have the right link on the page" do
    visit '/'
    click_link "about"
    response.should have_selector('title', :content => "about")
    click_link "help"
    response.should have_selector( 'title', :content => "help")
    click_link "contact"
    response.should have_selector('title', :content => "contact")
  end
end
