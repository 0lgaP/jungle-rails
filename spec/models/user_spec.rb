require 'rails_helper'

RSpec.describe User, type: :model do
  #all fields are present
  it 'is able to save when all input fiels are valid' do
  @user = User.new({
    first_name: "Ru",
    last_name: "Paul",
    email: "kity_gurl@gmail.com", 
    password: "jeorgeous",
    password_confirmation: "jeorgeous"
  })
    expect(@user).to be_valid
  end

  #password and password_confirmation must match
  it 'does not save if password and password_confirmation is not the same' do
    @user = User.new({
      first_name: "Ru",
      last_name: "Paul",
      email: "strong_bad@gmail.com",
      password: "Limozeen",
      password_confirmation: "limozeen"
    })
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).to eql (["Password confirmation doesn't match Password"])
  end

  #no password
  it 'does not save if password or password_confirmation is missing' do
    @user = User.new({
      first_name: "Ru",
      last_name: "Paul",
      email: "strong_bad@gmail.com",
      password_confirmation: "limozeen"
    })
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).to eql (["Password can't be blank", "Password can't be blank", "Password is too short (minimum is 6 characters)"])
  end
  #duplicate email - case difference only
  it 'is not able to create user if email already in database' do
    @user = User.new({
      first_name: "Coolio",
      last_name: "Da Fabio",
      email: "cool@gmail.com",
      password: "neat-000",
      password_confirmation: "neat-000"
    })
    @user.save
    @user2 = User.new({
      first_name: "Pizza",
      last_name: "Pal",
      email: "COOL@gmail.com",
      password: "loves_me",
      password_confirmation: "loves_me"
    })
    expect(@user2).to_not be_valid
    expect(@user2.errors.full_messages).to eql (["Email has already been taken"])
  end
  #no email
  it 'does not save if email is missing' do
    @user = User.new({
      first_name: "Strong",
      last_name: "Bad",
      password: "limozeen",
      password_confirmation: "limozeen"
    })
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).to eql (["Email can't be blank"])
  end
  #no first name
  it 'does not save if first_name is missing' do
    @user = User.new({
      last_name: "Bad",
      email: "COOL@gmail.com", 
      password: "limozeen",
      password_confirmation: "limozeen"
    })
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).to eql (["First name can't be blank"])
  end
  #no last name
  it 'does not save if last_name is missing' do
    @user = User.new({
      first_name: "Strong",
      email: "COOL@gmail.com", 
      password: "limozeen",
      password_confirmation: "limozeen"
    })
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).to eql (["Last name can't be blank"])
  end
  #min password length
  it 'does not save if password is not long enough' do
    @user = User.new({
      first_name: "Strong",
      last_name: "Bad",
      email: "COOL@gmail.com", 
      password: "limo",
      password_confirmation: "limo"
    })
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).to eql (["Password is too short (minimum is 6 characters)"])
  end

  describe '.authenticate_with_credentials' do
    it 'signs in a new user if email and password are correct' do
      @user = User.new({
        first_name: "Strong",
        last_name: "Bad",
        email: "COOL@gmail.com", 
        password: "limozeen",
        password_confirmation: "limozeen"
      })
      @user.save
      @user2 = User.authenticate_with_credentials("COOL@gmail.com", "limozeen")
      expect(@user).to eq(@user2)
    end

  end


end
