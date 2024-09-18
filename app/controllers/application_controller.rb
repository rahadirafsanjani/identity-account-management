class ApplicationController < ActionController::API
  def client_app
    begin
      client = Doorkeeper::Application.find_by(uid: params[:client_id], secret: params[:client_secret])
      if client.nil?
        render json: { error: 'Client application not found' }, status: :not_found
      end
    rescue StandardError => e
      Rails.logger.error("An error occurred: #{e.message}")
      render json: { error: 'Internal server error' }, status: :internal_server_error
    end
  end
end
