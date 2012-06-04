require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :firstname => "MyString",
      :lastname => "MyString",
      :login => "MyString",
      :email => "MyString",
      :password => "MyString",
      :password_confirmation => "MyString",
      :remember_me => 1,
      :picture => "MyString",
      :address => "MyString",
      :postalCode => "MyString",
      :city => "MyString",
      :country => "MyString",
      :full_address => "MyString",
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path(@user), :method => "post" do
      assert_select "input#user_firstname", :name => "user[firstname]"
      assert_select "input#user_lastname", :name => "user[lastname]"
      assert_select "input#user_login", :name => "user[login]"
      assert_select "input#user_email", :name => "user[email]"
      assert_select "input#user_password", :name => "user[password]"
      assert_select "input#user_password_confirmation", :name => "user[password_confirmation]"
      assert_select "input#user_remember_me", :name => "user[remember_me]"
      assert_select "input#user_picture", :name => "user[picture]"
      assert_select "input#user_address", :name => "user[address]"
      assert_select "input#user_postalCode", :name => "user[postalCode]"
      assert_select "input#user_city", :name => "user[city]"
      assert_select "input#user_country", :name => "user[country]"
      assert_select "input#user_full_address", :name => "user[full_address]"
      assert_select "input#user_latitude", :name => "user[latitude]"
      assert_select "input#user_longitude", :name => "user[longitude]"
    end
  end
end
