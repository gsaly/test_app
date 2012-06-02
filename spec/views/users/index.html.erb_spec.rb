require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
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
      ),
      stub_model(User,
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
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Firstname".to_s, :count => 2
    assert_select "tr>td", :text => "Lastname".to_s, :count => 2
    assert_select "tr>td", :text => "Login".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    assert_select "tr>td", :text => "Password Confirmation".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Picture".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Postal Code".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Full Address".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
