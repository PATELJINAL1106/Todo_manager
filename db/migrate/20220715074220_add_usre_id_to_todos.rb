class AddUserIdToTodos < ActiveRecord::Migration[7.0]
  def change
    add_column :todos, :user_id, :bigint
  end
end