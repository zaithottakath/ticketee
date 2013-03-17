require 'spec_helper'

feature "Deleting Users" do
  let!(:admin_user) { Factory(:admin_user) }
  let!(:user) { Factory(:user) }

  before do
    sign_in_as!(admin_user)
    visit '/'
    click_link 'Admin'
    click_link 'User'
  end

  scenario "Deleting a User" do
    click_link user.email
    click_link "Delete User"
    page.should have_content("User has been deleted")
  end

  scenario "User cannot delete themselves" do
    click_link admin_user.email
    click_link "Delete User"
    page.should have_content("You cannot delete yourself!")
  end
end
