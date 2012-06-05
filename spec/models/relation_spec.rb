require 'spec_helper'

describe Relation do
  pending "add some examples to (or delete) #{__FILE__}"
  
  
  let(:follower) { Factory.create(:user) }
  let(:followed) { Factory.create(:user) }
  let(:relation) { follower.relations.build(followed_id: followed.id) }

  subject { relation }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to follower_id" do
      expect do
        Relation.new(follower_id: follower.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)  #follower_id is not attribute accessible
    end    
  end
  
  #test the user belongs_to relations association
  describe "follower methods" do    
    it { should respond_to(:follower) }
    it { should respond_to(:followed) }
    its(:follower) { should == follower }
    its(:followed) { should == followed }
  end
  
  describe "when followed id is not present" do
    before { relation.followed_id = nil }
    it { should_not be_valid }
  end

  describe "when follower id is not present" do
    before { relation.follower_id = nil }
    it { should_not be_valid }
  end
  
end
