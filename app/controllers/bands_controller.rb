class BandsController < ApplicationController
  before_filter :authenticate

  def edit
    @band = Band.find_by(id: params[:id])
    render :edit
  end

  def update
    band = Band.find_by(id: params[:id])

    if band.valid?
      band.update(band_params)
      redirect_to band_url(band)
    else
      flash.now[:errors] = band.errors.full_messages
      render :edit
    end
  end

  def destroy
    band = Band.find_by(id: params[:id])
    band.destroy

    @bands = Band.all
    render :index
  end

  def show
    @band = Band.find_by(id: params[:id])
    render :show
  end

  def new
  end

  def index
    @bands = Band.all
    render :index
  end

  def create
    band = Band.new(band_params)

    if band.valid?
      band.save
      redirect_to band_url(band)
    else
      flash.now[:errors] = band.errors.full_messages
      render :new
    end
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end
end
