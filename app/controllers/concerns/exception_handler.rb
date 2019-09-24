# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, status: :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ message: e.message }, status: :unprocessable_entity)
    end

    rescue_from ActionController::ParameterMissing do |e|
      json_response({ message: e.message }, status: :bad_request)
    end
  end
end
