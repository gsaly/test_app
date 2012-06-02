require "rspec"

describe "Static pages" do

  describe "Home page" do
=begin
    it "should have the base title" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => "Ruby on Rails Test App")

    end

    it "should not have a custom page title" do
      visit '/static_pages/home'
      page.should_not have_selector('title', :text => '| Home')
    end
=end
    it "should have the content 'BIENVENUE'" do
      visit '/static_pages/home'
      page.should have_content('BIENVENUE')
    end
  end


  describe "Help page" do

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      page.should have_content('Help')
    end

    it "should have the h1 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text => '| Help')
    end

  end

end