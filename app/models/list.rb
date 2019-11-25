class List < ApplicationRecord
  belongs_to :board
  has_many :tasks, dependent: :destroy

  def self.all_lists(board_id)
   List.find_by_sql(
      "SELECT *
      FROM lists AS l
      WHERE l.board_id = #{board_id} 
      "
    )
  end

  def user_filter(list_id)
    @user_filter = nil

    if @user_filter = @asc
      Task.find_by_sql(
        "SELECT *
        FROM lists
        WHERE lists.task_id = #{task_id}
        ORDER BY prioirity ASC"
      )
    else @user_filter = @desc 
      Task.find_by_sql(
          "SELECT *
          FROM lists
          WHERE lists.task_id = #{task_id}
          ORDER BY prioirity DESC"
        )
    end
  end

end
