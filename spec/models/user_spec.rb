require 'spec_helper'

describe User do
  
    before(:each) do
        @attr = { :name => 'przykladowe imie', :email => 'user@mail.com'}
    end
    
    it 'should create a new instance given valid attributes' do
        #User.create(@attr)
    end
    it 'should require a name' do
        user_bez_nazwy = User.new(@attr.merge(:name => ''))
        user_bez_nazwy.should_not be_valid
    end
    it "should have the email address" do
        user_bez_email = User.new(@attr.merge(:email => ''))
        user_bez_email.should_not be_valid
    end
    it 'should not to be so long' do
        long_name = "a" * 51
        # 51 * znak 'a' daje nam string o long_name.length = 51
        long_name_user = User.new(@attr.merge(:name => long_name))
        long_name_user.should_not be_valid    
    end
    it 'should reject duplicate email addresses' do
        User.create!(@attr)
        user_zly = User.new(@attr)
        user_zly.should_not be_valid    
    end
    it 'should reject email addresses identical up to case' do
        wielkie_litery_email = @attr[:email].upcase
        User.create!(@attr.merge(:email => wielkie_litery_email))
        zly_email = User.new(@attr)
        zly_email.should_not be_valid    
    end
end
