require 'spec_helper'

describe User do
  #pending "add some examples to (or delete) #{__FILE__}"

  before do
    @user = User.new(name: "test3", email: "test3@example.com",
                     password: "testme", password_confirmation: "testme")
  end

  describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end
  
  #it is replacing the @user instance variable
  it { should respond_to(:feed) }
  it { should respond_to(:relations) }
  
  it { should respond_to(:relations) }
  it { should respond_to(:followed_users) }


end
