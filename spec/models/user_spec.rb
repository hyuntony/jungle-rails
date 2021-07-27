require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'validations' do
    it 'will save if valid' do
      @user = User.new(first_name: 'Anthony', last_name: 'Kim',
      password: '123456', password_confirmation: '123456', email: 'a@gmail.com')
      @user.save

      expect(@user).to be_valid
    end

    context 'password and password_confirmation fields' do
      it 'throws an error when password and confirmation does not match' do
        @user = User.new(first_name: 'Anthony', last_name: 'Kim',
        password: '123456', password_confirmation: '1234567', email: 'a@gmail.com')
        @user.save

        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        expect(@user).to_not be_valid
      end

      it 'is not valid without a password' do
        @user = User.new(first_name: 'Anthony', last_name: 'Kim',
        password_confirmation: '1234567', email: 'a@gmail.com')
        @user.save
        
        expect(@user.errors.full_messages).to include("Password can't be blank")
        expect(@user).to_not be_valid
      end
      
      it 'is not valid without a password confirmation' do
        @user = User.new(first_name: 'Anthony', last_name: 'Kim',
        password: '123456', password_confirmation: nil, email: 'a@gmail.com')
        @user.save
        
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
        expect(@user).to_not be_valid
      end
    end

    it 'is not valid if email is not unique' do
      @user1 = User.new(first_name: 'Anthony', last_name: 'Kim',
      password: '123456', password_confirmation: '123456', email: 'TEST@TEST.com')
      @user1.save
      @user2 = User.new(first_name: 'Anthony', last_name: 'Kim',
      password: '123456', password_confirmation: '123456', email: 'TEST@test.com')
      @user2.save

      expect(@user2.errors.full_messages).to include("Email has already been taken")
      expect(@user2).to_not be_valid
    end

    it 'is not valid without an email' do
      @user = User.new(first_name: 'Anthony', last_name: 'Kim',
      password: '123456', password_confirmation: '123456', email: nil)
      @user.save 

      expect(@user.errors.full_messages).to include("Email can't be blank")
      expect(@user).to_not be_valid
    end

    it 'is not valid without a first name' do
      @user = User.new(first_name: nil, last_name: 'Kim',
      password: '123456', password_confirmation: '123456', email: 'TEST@TEST.com')
      @user.save

      expect(@user.errors.full_messages).to include("First name can't be blank")
      expect(@user).to_not be_valid
    end

    it 'is not valid without a last name' do
      @user = User.new(first_name: 'Anthony', last_name: nil,
      password: '123456', password_confirmation: '123456', email: 'TEST@TEST.com')
      @user.save

      expect(@user.errors.full_messages).to include("Last name can't be blank")
      expect(@user).to_not be_valid
    end

    describe 'password' do
      it 'is not valid when the password length is less than 6' do
        @user = User.new(first_name: 'Anthony', last_name: 'Kim',
        password: '12345', password_confirmation: '12345', email: 'TEST@TEST.com')
        @user.save
  
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        expect(@user).to_not be_valid
      end
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should be authenticated if emailed entered has a few spaces before and after their email address' do
      @user = User.new(first_name: 'Anthony', last_name: 'Kim',
      password: '123456', password_confirmation: '123456', email: '      example@domain.com     ')
      @user.save

      user = User.authenticate_with_credentials('  example@domain.com ', '123456')
      expect(user).to_not be_nil
    end

    it 'should be authenticated for emails typed with the wrong case' do
      @user = User.new(first_name: 'Anthony', last_name: 'Kim',
      password: '123456', password_confirmation: '123456', email: 'eXample@domain.COM')
      @user.save

      user = User.authenticate_with_credentials('EXAMPLe@DOMAIN.CoM', '123456')
      expect(user).to_not be_nil
    end
  end


end
