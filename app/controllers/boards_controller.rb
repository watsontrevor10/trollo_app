class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  def index
    @boards = current_user.boards
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
    
  end

  def show
  end

  def destroy
    
  end

  private

  def board_params
    params.require(:board).permit(:name)
  end

  def set_board
    @board = Board.find(params[:id])
  end
end
