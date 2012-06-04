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

end
