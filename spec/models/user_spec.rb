require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'Validations' do
    # :first_name, :last_name, :email, :password, :password_confirmation
    it 'it should have password and password_confirmation' do
      @user = User.new first_name: 'Joao', email:'a@a', last_name: 'Squillace', password: '111111', password_confirmation: '111111'
      expect(@user).to be_valid
    end

    it 'it should have password and password_confirmation' do
      @user = User.new  email:'a@a', last_name: 'Squillace', password: '111111', password_confirmation: '111111'
      expect(@user).not_to be_valid
    end

    it 'it should match password and password_confirmation' do
      @user = User.new  first_name: 'Joao', email:'a@a', last_name: 'Squillace', password: '222222', password_confirmation: '111111'
      expect(@user).not_to be_valid
    end

    it 'email should be unique' do
      @user = User.create  first_name: 'Joao', email:'b@a', last_name: 'Squillace', password: '111111', password_confirmation: '111111'
      @user2 = User.create  first_name: 'Pedro', email:'B@a', last_name: 'Henrique', password: '222222', password_confirmation: '222222'
      expect(@user2).not_to be_valid
    end

    it 'password should be have more than 6 characters' do
      @user = User.create  first_name: 'Joao', email:'b@a', last_name: 'Squillace', password: '111', password_confirmation: '111'
      expect(@user).not_to be_valid
    end

  end

  describe '.authenticate_with_credentials' do
    it 'it should login if credentials match' do
      @user = User.create  first_name: 'Joao', email:'b@a', last_name: 'Squillace', password: '111111', password_confirmation: '111111'
      @authenticated = User.authenticate_with_credentials('b@a','111111')
      expect(@authenticated).to be_a(User)
    end

    it 'it should not login if credentials does not match' do
      @user = User.create  first_name: 'Joao', email:'b@a', last_name: 'Squillace', password: '111111', password_confirmation: '111111'
      @authenticated = User.authenticate_with_credentials('a@a','22222222222')
      expect(@authenticated).not_to be_a(User)
    end

    it 'it should login even if there is upercase in email or spaces before or after' do
      @user = User.create  first_name: 'Joao', email:'b@a', last_name: 'Squillace', password: '111111', password_confirmation: '111111'
      @authenticated = User.authenticate_with_credentials('B@a  ','111111  ')
      expect(@authenticated).to be_a(User)
    end
  end
end
