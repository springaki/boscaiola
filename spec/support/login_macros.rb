module LoginMacros

  def sign_in_as_new_user(user = nil)
    user ||= create :user
    user
  end

end