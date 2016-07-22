require 'rails_helper'

feature 'Users spec' do

  scenario 'トップページが表示されること' do
    visit root_path
    expect(page).to have_http_status :ok
  end

  scenario 'JSドライバが動作すること', js: true do
    visit root_path
    expect(page).to have_http_status :ok
  end

  scenario 'need Log in' do
    visit '/'
    expect(page).to have_content 'You need to sign in or sign up before continuing'
  end

  scenario 'ログインした場合、ユーザの一覧ページへリダイレクトすること' do
    user = sign_in_as_new_user
    expect(page).to have_content 'Signed in successfully'
    save_and_open_page
    expect(current_path).to eq home_path
    expect(page).to have_content user.email
  end

end
