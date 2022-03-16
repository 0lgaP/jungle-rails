class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: {case_sensitive: false}
  validates :email, :first_name, :last_name, :password, presence: true
  validates :password, length: { minimum: 6 }

  # def new_method(email, password)
  #   authenticate_with_credentials(email, password)
  # end

  def self.authenticate_with_credentials(email, password)
    if email
    email = email.strip.downcase
    end
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end

  end


end
