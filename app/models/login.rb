class Login
  include ActiveAttr::BasicModel
  include ActiveAttr::MassAssignment
  attr_accessor :email, :password

  def authenticate
    reader = Reader.find_by(email: email)
    if reader
      reader.id
    else
      nil
    end
  end
end
