require 'spec_helper'

describe User do
  
    before(:each) do
        @attr = { 
            :name => 'przykladowe imie', 
            :email => 'user@mail.com',
            :password => 'codeispoetry',
            :password_confirmation => 'codeispoetry'
            }
    end
    
    it 'should create a new instance given valid attributes' do
        User.create(@attr)
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
    
    describe 'password validation' do
        it 'should require a password' do
            User.new(@attr.merge(:password => '',
                                 :password_confirmation => ''))
            should_not be_valid
        end
        it 'should require a matching password confirmation' do
            User.new(@attr.merge(:password_confirmation => 'zloo'))
            should_not be_valid
        end
        it "should reject short password" do
            short = 'a' * 5
            hash = @attr.merge(:password => short,
                               :password_confirmation => short)
            User.new(hash).should_not be_valid
        end
        it "should reject long password" do
            long = 'a' * 21
            hash = @attr.merge(:password => long,
                               :password_confirmation => long)
            User.new(hash).should_not be_valid
        end
    end
    
    describe 'password encryption' do
        
        before(:each) do
            @user = User.create!(@attr)
        end
        
        it "should have an ancrypted password attribute" do
            @user.should respond_to(:encrypted_password)
        end
        it 'should set the encrypted password' do
            @user.encrypted_password.should_not be_blank    
        end
        
        describe 'authenticate method' do
            
            it 'should return nil on email/password mismatch' do
                zle_haslo_user = User.authenticate(@attr[:email], 'zlehaslo')
                zle_haslo_user.should be_nil   
            end
            it 'should return nil on email address without user' do
                nieistniejacy_user = User.authenticate("ba@foo.com", @attr[:password])
                nieistniejacy_user.should be_nil    
            end
            it 'should return user object on email/password match' do
                dobry_user = User.authenticate(@attr[:email],@attr[:password])
                dobry_user.should == @user    
            end    
        end 
        
   end
   
    describe 'has_password? method' do
        it 'should be true if the passwords match' do
            @user.has_password?(@attr[:password]).should be_true
        end
        it 'should be false if the passwords don\'t match'do
            @user.has_password?('zloooo').should be_false
        end   
    end

end
