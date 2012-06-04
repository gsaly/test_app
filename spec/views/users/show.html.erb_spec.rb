require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :firstname => "Firstname",
      :lastname => "Lastname",
      :login => "Login",
      :email => "Email",
      :password => "Password",
      :password_confirmation => "Password Confirmation",
      :remember_me => 1,
      :picture => "Picture",
      :address => "Address",
      :postalCode => "Postal Code",
      :city => "City",
      :country => "Country",
      :full_address => "Full Address",
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Firstname/)
    rendered.should match(/Lastname/)
    rendered.should match(/Login/)
    rendered.should match(/Email/)
    rendered.should match(/Password/)
    rendered.should match(/Password Confirmation/)
    rendered.should match(/1/)
    rendered.should match(/Picture/)
    rendered.should match(/Address/)
    rendered.should match(/Postal Code/)
    rendered.should match(/City/)
    rendered.should match(/Country/)
    rendered.should match(/Full Address/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
  end
end
