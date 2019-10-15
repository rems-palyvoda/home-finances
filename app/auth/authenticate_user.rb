# frozen_string_literal: true

class AuthenticateUser
  attr_reader :email, :password

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  def user
    user = User.find_by email: email
    raise_no_user unless user
    user if user && user.authenticate(password)
  end

  def raise_no_user
    raise ExceptionHandler::AuthenticationError, Message.invalid_credentials
  end
end
