class AddAssociationToTasks < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasks, :board, index: true, foreign_key: true
  end
end
