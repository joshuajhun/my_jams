require 'test_helper'

class GuestCreatesAccountTest < ActionDispatch::IntegrationTest
  test 'user can create an account' do
    visit new_user_path
    fill_in "Username", with: "jhunbug"
    fill_in "Password", with: 'password'
    click_button "Create Account"

    assert page.has_content?("Welcome jhunbug.")
  end 
end
