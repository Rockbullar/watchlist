class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  # GET /restaurants
  def index
    @lists = List.all
  end

  # GET /restaurants/1
  def show
    @bookmark = Bookmark.new
  end

  # GET /restaurants/new
  def new
    @list = List.new
  end

  # POST /restaurants
  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to list_path(@list), notice: 'list was successfully added.'
    else
      render :new
    end
  end

  # DELETE /restaurants/1
  def destroy
    @list.destroy
    redirect_to lists_path, notice: 'list was successfully removed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_list
    @list = List.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def list_params
    params.require(:list).permit(:name)
  end
end
