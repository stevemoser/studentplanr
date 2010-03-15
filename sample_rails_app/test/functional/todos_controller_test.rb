require 'test_helper'

class TodosControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:todos)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_todos
    assert_difference('Todos.count') do
      post :create, :todos => { }
    end

    assert_redirected_to todos_path(assigns(:todos))
  end

  def test_should_show_todos
    get :show, :id => todos(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => todos(:one).id
    assert_response :success
  end

  def test_should_update_todos
    put :update, :id => todos(:one).id, :todos => { }
    assert_redirected_to todos_path(assigns(:todos))
  end

  def test_should_destroy_todos
    assert_difference('Todos.count', -1) do
      delete :destroy, :id => todos(:one).id
    end

    assert_redirected_to todos_path
  end
end
