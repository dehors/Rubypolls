class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
 
  protected
  
  def authenticate
  	token_str = params[:token]
  	token = Token.find_by(token: token_str)

  	if token.nil? or not token.is_valid?
  		render json: {error: "invalido", status: :unauthorized}
  	else
  		@current_user = token.user
  	end

  end

  def authenticate_owner(user)
    if owner !=@current_user
      render json: { errors: "No tiene autorizado eliminar esa encuesta" }, status: 401
   end    
  end

end
