require 'spec_helper'

feature 'Creating Projects' do
  scenario "can create a project" do
    visit '/'
      # FAIL 1 pg 71
      # => click_link 'New Project'
      # => no link with title, id or text 'New Project' found
      # Fix 1 pg 72
      # => delete public/index.html and git rm public/index.html

      #Fail 2 pg 72
      # => visit '/'
      # => ActionController:: RoutingError: No route matches [Get] "/"
      #Fix 2 pg 73
      # => edit config/routhes.rb add
      # => root :to => "projects#index"

      #Fail 3 pg 73
      # => visit '/'
      # ActionController::RoutingError: uninitialized constant ProjectsController
      #Fix 3 pg 73
      # => bash: rails generate controller projects
      # generated ProjectController

      #Fail 4 pg 75
      # => visit '/'
      # => AbstractController::ActionNotFound: The action 'index' could not be found for ProjectsController
      #Fix
      # => app/controller/project_controller.rb  add: def index

      #Fail 5 pg 76 : can not find index in view
      #Fix: create index.html.erb in apps/views/projects/

      #Fail 6 pg 77: See fail 1
      #Fix add <%= link_to "New Project", new_project_path %>

    click_link 'New Project'
    fill_in 'Name', :with => 'TextMate 2'
    fill_in 'Description', :with => "A text-editor for OS X"
    click_button 'Create Project'
    page.should have_content ('Project has been created.')

    #3.4.4. Setting a page title
    project = Project.find_by_name("TextMate 2")
    page.current_url.should == project_url(project)
    title = "TextMate 2 - Projects - Ticketee"
    find("title").should have_content(title)
  end
end

