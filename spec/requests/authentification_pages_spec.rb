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
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email
        fill_in "Password", with: user.password
        click_button "Connexion"
      end

      it { should have_selector('title', text: "fiche de #{@user.login}") }
      it { should have_selector('a', 'Déconnexion', href: sign_out_path) }
    end
  end

end
