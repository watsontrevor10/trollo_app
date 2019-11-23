class ListsController < ApplicationController
  before_action :set_board
  before_action :set_list, only: [:edit, :update, :destroy]
  def index
    @list = @board.lists.all_lists(@board.id) 
  end

  def new
    @list = @board.lists.new 
  end

  def create
    @list = @board.lists.new(list_params)
    if @list.save
      redirect_to board_lists_path(@board)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @board.lists.update(list_params)
      redirect_to board_lists_path(@board)
    else
      render :edit
    end
  end

  def show
    
  end

  def destroy
    @list.destroy
    redirect_to board_lists_path(@board)
  end

  private

  def list_params
    params.require(:list).permit(:name, :priority)
  end

  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_list
    @list = List.find(params[:id])
  end
end
