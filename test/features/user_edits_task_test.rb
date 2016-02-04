require_relative '../test_helper'

class UserEditsTaskTest < Minitest::Test
  include Capybara::DSL
  include TestHelpers

  def test_with_valid_attributes
    task_id = task_manager.all.last.id
    #As a user
    #when I vist the show page for a Task
    vist "/tasks/#{task_id}"
    #and I click edit
    click_link 'Edit'

    #and I see the edit form
    assert_equal "/tasks/#{task_id}/edit"

    #and I edit the title and description


    #and I click submit
    #then I see my updated task
  end
end
