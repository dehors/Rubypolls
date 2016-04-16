class Token < ActiveRecord::Base
  belongs_to :user
  before_create :generate_token

  def is_valid?
  	DateTime.now < self.expires_at
  end
  #verifica si no ha expirado

  private

  def generate_token
  	begin
  		self.token = SecureRandom.hex
  	end while Token.where(token: self.token).any?
  	#que siga generando tokens hasta que encuentre uno que sea diferente para guardarlo
  	self.expires_at ||= 1.month.from_now
  	#expira dentro de un mes a partir de hoy
  end

end
