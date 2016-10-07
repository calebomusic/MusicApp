class TracksController < ApplicationController
  def edit
    @orig_track = Track.find_by(id: params[:id])
    @albums = Album.all
    render :edit
  end

  def update
    @track = Track.find_by(id: params[:id])

    if @track.valid?
      @track.update(track_params)
      render :show
    else
      flash.now[:errors] = @track.errors.full_messages
      @albums = Album.all
      render :new
    end
  end

  def new
    @albums = Album.all
    render :new
  end

  def create
    @track = Track.new(track_params)

    if @track.valid?
      @track.save
      render :show
    else
      fail
      flash.now[:errors] = @track.errors.full_messages
      @albums = Album.all
      render :new
    end
  end

  def show
    @track = Track.find_by(id: params[:id])
    render :show
  end

  private
  def track_params
    params.require(:track).permit(:name, :album_id, :kind, :lyrics)
  end
end
