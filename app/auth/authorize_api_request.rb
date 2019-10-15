# frozen_string_literal: true

class AuthorizeApiRequest
  attr_reader :headers

  def initialize(headers = {})
    @headers = headers
  end

  def call
    { user: user }
  end

  private

  def user
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
  rescue ActiveRecord::RecordNotFound => e
    raise ExceptionHandler::InvalidToken, "#{Message.invalid_token} #{e.message}"
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    raise_missing_token unless headers['Authorization'].present?
    headers['Authorization'].split(' ').last
  end

  def raise_missing_token
    raise ExceptionHandler::MissingToken, Message.missing_token
  end
end
