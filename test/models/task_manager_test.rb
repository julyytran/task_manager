require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  include TestHelpers

  def create_task(number)
    number.times do |i|
      data = {
        title: "my task #{i+1}",
        description: "cool task #{i+1}"
      }
      task_manager.create(data)
    end
  end

  def test_can_create_a_task
    create_task(1)
    task = task_manager.all.first

    assert task.id
    assert_equal 'my task 1', task.title
    assert_equal 'cool task 1', task.description
  end

  def test_can_return_all_tasks
    create_task(3)
    all = task_manager.all

    assert_equal 3, all.length
    all.each do |task|
      assert_kind_of Task, task
    end
  end

  def test_can_find_specific_task_from_id
    create_task(3)
    task = task_manager.find(2)

    assert_equal 2, task.id
  end

  def test_can_update_a_specific_task
    create_task(1)
    new_data = {
      title: 'MY TASK',
      description: 'COOL'
    }
    task_id = task_manager.all.last.id
    task = task_manager.find(task_id)

    assert_equal 'my task 1', task.title
    assert_equal 'cool task 1', task.description

    task_manager.update(1, new_data)
    task = task_manager.find(task_id)

    assert_equal 'MY TASK', task.title
    assert_equal 'COOL', task.description
  end

  def test_can_delete_a_task
    create_task(3)
    task_id = task_manager.all.last.id

    assert_equal 3, task_manager.all.count

    task_manager.delete(task_id)

    assert_equal 2, task_manager.all.count
  end
end
