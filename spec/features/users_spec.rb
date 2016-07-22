require 'rails_helper'

feature 'Users spec' do

  scenario 'need Log in' do
    visit '/'
    expect(page).to have_content 'You need to sign in or sign up before continuing'
  end

  # scenario 'ログインした場合、ユーザの一覧ページへリダイレクトすること' do
  #   sign_in_as_new_user
  #   # expect(page).to have_content 'Signed in successfully'
  #   # expect(current_path).to eq home_path
  # end

end
