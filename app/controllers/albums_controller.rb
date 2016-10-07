class AlbumsController < ApplicationController
  before_filter :authenticate

  def edit
    @album = Album.find_by(id: params[:id])
    @bands = Band.all
    render :edit
  end

  def new
    @bands = Band.all
    @album = Album.find_by(id: params[:id])
    render :new
  end

  def update
    @album = Album.find_by(id: params[:id])

    if @album.valid?
      @album.update(album_params)
      render :show
    else
      flash.now[:errors] = @album.errors.full_messages
      @bands = Band.all
      render :new
    end
  end

  def create
    @album = Album.new(album_params)

    if @album.valid?
      @album.save
      render :show
    else
      flash.now[:errors] = album.errors.full_messages
      @albums = Album.all
      fail
      render :new
    end
  end

  def show
    @album = Album.find_by(id: params[:id])
    @albums = Album.all
    render :show
  end

  def destroy
    @album = Album.find_by(id: params[:id])
    @album.destroy
    @bands = Band.all
    redirect_to bands_url
  end
  private
  def album_params
    params.require(:album).permit(:name, :band_id, :recording)
  end
end
