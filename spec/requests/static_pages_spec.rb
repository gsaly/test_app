# encoding: utf-8

require "rspec"

describe "Static pages" do

  describe "Static pages" do
    it "should have the right links on the layout" do
      visit root_path
      click_link "About"
      page.should have_selector 'title', text: full_title('About')
      click_link "Aide"
      page.should have_selector 'title', text: full_title('Help')
      click_link "Contact"
      page.should have_selector 'title', text: full_title('Contact Us')
      click_link "Accueil"
      page.should have_selector 'title', text: full_title('Home')
      click_link "Créer mon compte"
      page.should have_selector 'title', text: full_title('Sign_up')
    end
  end


=begin
  describe "Home page" do
    it "should have the base title" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => "Ruby on Rails Test App")

    end

    it "should not have a custom page title" do
      visit '/static_pages/home'
      page.should_not have_selector('title', :text => '| Home')
    end

    it "should have the content 'BIENVENUE'" do
      visit '/static_pages/home'
      page.should have_content('BIENVENUE')
    end
  end
=end

=begin

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
=end

end