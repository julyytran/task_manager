require_relative '../test_helper'

class UserCreatesTaskTest < Minitest::Test
  include Capybara::DSL
  include TestHelpers

  def test_with_valid_attributes
    #As a user
    #When I visit the home page
    visit '/'

    #I click 'New Task'
    click_link 'New Task'
    #And I fill in the title
    fill_in 'task[title]', with: 'The Newest Task'
    #And I fill in the description
    fill_in 'task[description]', with: 'Omg cool new task!'
    #And I click submit
    click_button 'Submit'

    assert_equal '/tasks', current_path

    #then i should see my task
    within '#tasks' do
    assert page.has_content?('The Newest Task')
    end

  end
end
