class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  before_action :authorize_request
  attr_reader :current_user

  private

  def authorize_request
    service = AuthorizeApiRequest.new(request.headers).call
    @current_user = service[:user]
  end
end
