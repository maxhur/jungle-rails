require 'rails_helper'
require 'authenticate'

RSpec.describe User, type: :model do
  describe 'Validations' do

    before do 
      @user = User.new(name: "Teddy Bob", email: "user@example.com", password: "password", password_confirmation: "password")
    end

    it 'is valid with all correct parameters' do
      expect(@user).to be_valid
    end

    it 'is invalid without a password' do
      @user.password = nil
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'is invalid without a password confirmation' do
      @user.password_confirmation = nil 
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it 'is invalid when password and password confirmation do not match' do
      @user.password = "wrongpass"
      @user.password_confirmation = "rightpass"
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'is invalid wihtout an Email' do
      @user.email = nil
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'is invalid when email is not unique' do
      @user.save
      user2 = User.new(name: "Ducky Duck", email: "user@example.com", password: "password", password_confirmation: "password")
      expect(user2).not_to be_valid
      expect(user2.errors.full_messages).to include("Email has already been taken")
      user3 = User.new(name: "Mucky Duck", email: "USER@EXAMPLE.com", password: "password", password_confirmation: "password")
      expect(user3).not_to be_valid
      expect(user3.errors.full_messages).to include("Email has already been taken")
    end

    it 'is invalid if password is less than 8' do
      @user.password = "short"
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end

  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here

    before do 
      @user = User.new(name: "Teddy Bob", email: "user@example.com", password: "password", password_confirmation: "password")
    end


    it 'authenticates a user with leading and trailing spaces in their email address' do
      expect(Authenticate_with_credentials.authenticate_with_credentials(" user@example.com  ")).to eq(@user.email)
    end
  

    it 'is valid when a user with a case-insensitive email address' do
      puts Authenticate_with_credentials.authenticate_with_credentials(" User@ExaMple.CoM ")
      expect(Authenticate_with_credentials.authenticate_with_credentials(" User@ExaMple.CoM ")).to eq(@user.email)
    end
  end

end
