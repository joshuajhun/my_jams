require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  test "a registered user can log in" do
    User.create(username:'jhunbug',
                 password: 'dana')

    visit login_path
    fill_in 'Username', with: "jhunbug"
    fill_in 'Password', with: 'dana'
    click_button "Login"

    assert page.has_content?('Welcome jhunbug.')
    assert page.has_content?("Logout")

  end

  test 'if user puts in incorrect password it will create a flash message error' do
    User.create(username:'jhunbug',
                 password: 'dana')

     visit login_path
     fill_in 'Username', with: 'jhunbug'
     fill_in 'Password', with: 'stuff'
     click_button 'Login'

     assert page.has_content? ('Invalid Credentials Try Again')
     assert page.has_content?("Login")

   end

   test 'if user puts in incorrect username it will create a flash message error' do
     User.create(username:'jhunbug',
                  password: 'dana')

      visit login_path
      fill_in 'Username', with: 'jhunbuggy'
      fill_in 'Password', with: 'dana'
      click_button 'Login'

      assert page.has_content? ('Invalid Credentials Try Again')
      assert page.has_content?("Login")

    end

  test 'unregistered user cannot log in' do
    visit login_path
    fill_in 'Username', with: 'jhunbug'
    fill_in 'Password', with: 'stuff'
    click_button 'Login'

    assert page.has_content? ('Invalid Credentials Try Again')
    assert page.has_content?("Login")

  end

  test 'user can logout' do
    User.create(username:'jhunbug',
                 password: 'dana')

    visit login_path
    fill_in 'Username', with: "jhunbug"
    fill_in 'Password', with: 'dana'
    click_button "Login"

    assert page.has_content?("Welcome jhunbug.")

    click_link 'Logout'

    assert page.has_content?("Goodbye!")
    assert page.has_content?("Login")

  end

end
