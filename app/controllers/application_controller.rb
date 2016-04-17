class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :null_session

  before_action :set_jbuilder_defaults
 
  protected
  
  def authenticate
  	token_str = params[:token]
  	token = Token.find_by(token: token_str)

  	if token.nil? or not token.is_valid?
  		#render json: {error: "invalido", status: :unauthorized}
  	 error!("Tu token es invalido",:unauthorized)
    else
  		@current_user = token.user
  	end

  end
  def set_jbuilder_defaults
    @errors = []
  end
  def error!(message, status)
    @errors << message
    response.status = status
    render template: "api/v1/errors"
  end
  def error_array!(array, status)
   @errors = @errors + array
   render template: "api/v1/errors" 
  end
  def authenticate_owner(user)
    if owner !=@current_user
      render json: { errors: "No tiene autorizado eliminar esa encuesta" }, status: 401
   end    
  end

end
