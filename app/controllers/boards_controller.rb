class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  def index
    # Active Record way
    #@boards = current_user.boards

    # find_by_sql way
    @boards = Board.all_boards(current_user.id)
  end

  def new
    @board = Board.new 
  end

  def create
    @board = current_user.boards.new(board_params)

    if @board.save 
      redirect_to board_path(@board)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @board.update(board_params)
      redirect_to board_path(@board)
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @board.destroy
    redirect_to boards_path
  end

  private

  def board_params
    params.require(:board).permit(:name)
  end

  def set_board
    @board = Board.find(params[:id])
  end
end
