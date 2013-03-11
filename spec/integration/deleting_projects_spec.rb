require 'spec_helper'

feature "Deleting projects" do
  scenario "Deleting a project" do
    Factory(:project, :name => "Textmate 2")
    visit "/"
    #binding.pry
    click_link "Textmate 2"
    click_link "Delete Project"
    page.should have_content("Project has been deleted.")

    visit "/"
    page.should_not have_content("TextMate 2")
  end
end
