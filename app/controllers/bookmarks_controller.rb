class BookmarksController < ApplicationController
    before_action :set_bookmark, only: [:show, :edit, :update, :destroy]

  # GET /restaurants
  def index
    @bookmarks = Bookmark.all
  end

  # GET /restaurants/1
  def show
  end

  # GET /restaurants/new
  def new
    @bookmark = bookmark.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  def create
    @bookmark = bookmark.new(bookmark_params)

    if @bookmark.save
      redirect_to @bookmark, notice: 'bookmark was successfully added.'
    else
      render :new
    end
  end

  # PATCH/PUT /restaurants/1
  def update
    if @bookmark.update(bookmark_params)
      redirect_to @bookmark, notice: 'bookmark was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /restaurants/1
  def destroy
    @bookmark.destroy
    redirect_to bookmarks_url, notice: 'bookmark was successfully removed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bookmark
    @bookmark = bookmark.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def list_params
    params.require(:list).permit(:name)
  end
end
