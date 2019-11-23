class AddPriorityToListsAndTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :lists, :priority, :string
    add_column :tasks, :priority, :string
  end
end
