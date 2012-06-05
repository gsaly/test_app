# encoding: utf-8
require 'spec_helper'

describe "AuthentificationPages" do
=begin
  describe "GET /authentification_pages" do

    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get authentification_pages_index_path
      response.status.should be(200)
    end
  end
=end

  subject { page }

  describe "sign_in" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Connexion" }

      it { should have_selector('title', text: 'Sign_in') }
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }
    end

    describe "with valid information" do
      let(:user) { Factory.create(:user) }
      before do
        fill_in "Email",    with: user.email
        fill_in "Password", with: user.password
        click_button "Connexion"
      end

      it { should have_selector('title', text: "fiche de #{@user.login}") }
      it { should have_selector('a', 'Déconnexion', href: sign_out_path) }
    end
  end
  
  
  describe "Authorization" do
  
    #for non signed user
    describe "for non-signed-in users" do
        let(:user) { Factory.create(:user) }
  
        describe "in the Users controller" do
  
          describe "visiting the edit page" do
            before { visit edit_user_path(user) }
            it { should have_selector('title', text: 'Sign_in') }
          end
  
          describe "submitting to the update action" do
            before { put user_path(user) }
            specify { response.should redirect_to(sign_in_path) }
          end
        end
     end
  
  
     describe "as wrong user" do
        let(:user) { Factory.create(:user) }
        let(:wrong_user) { Factory.create(:user, email: "wrong_user@example.com") }
        before { sign_in_after_signup user }
  
        describe "visiting Users#edit page" do
          before { visit edit_user_path(wrong_user) }
          it { should_not have_selector('title', text: full_title('Modifier profil')) }
        end
  
  
        describe "submitting a PUT request to the Users#update action" do
          before { put user_path(wrong_user) }
          specify { response.should redirect_to(root_path) }
        end
     end
     
     describe "visiting the user index" do
       before { visit users_path }
       it { should have_selector('title', text: 'Sign_in') }
     end

  end
end
