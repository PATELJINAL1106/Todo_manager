# todos_controller.rb
class todosController < AppplicationController
    # skip_before_action :verify_authenticity_token

    def index 
        @todos = @current_user.todos
        # render plain: Todo.order(:due_date).map { |todo| todo.to_pleasant_string }.join("\n")
        render "index"
    end

    #def show
    # id = params[:id]
    # todo = @current_user.todos.find(id)
    # render plain: todo.to_pleasant_string
    #end

    def create
        todo_text = params[:todo_text]
        due_date = params[:due_date]
        new_todo = Todo.new(
            todo_text: todo_text,
            due_date: due_date,
            completed: false,
            user_id: @current_user.id,
        )
        if new_todo.save 
            redirect_to todos_path
        else
            flash[:error] = new_todo.errors.full_messages.join(",  ")
      redirect_to todos_path
    end
    # redirect_to todos_path
  end

  def update
    id = params[:id]
    completed = params[:completed]
    todo = @current_user.todos.find(id)
    todo.completed = completed
    todo.save!
    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = @current_user.todos.find(id)
    todo.destroy
    redirect_to todos_path
  end
end