require 'test_helper'

class AdminCanCreateCategoriesForSongsTest < ActionDispatch::IntegrationTest

  test 'admins can create categories for songs' do
    admin = User.create(username: "professor oak",
                        password: 'pokeball',
                            role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit new_admin_category_path

    fill_in "Name", with: "Acoustic"

    click_button "Create New Category"
  end
end
