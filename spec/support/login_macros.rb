module LoginMacros

  def sign_in_as_new_user(user = nil)
    user ||= create :user
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    user
  end

end