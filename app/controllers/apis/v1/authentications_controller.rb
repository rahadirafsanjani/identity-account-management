class Apis::V1::AuthenticationsController < ApplicationController
  before_action :client_app

  # GET /api/v1/auth/authorize
  def show
    begin
      render json: { message: 'Authorization details displayed' }, status: :ok
    rescue StandardError => e
      render json: { message: e }, status: :ok
    end
  end

  # POST /api/v1/auth/authorize
  def create
    render json: { message: 'Authorization created successfully' }, status: :created
  end


end
