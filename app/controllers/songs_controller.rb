
class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update]
  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      session[:most_recent_song_id] = @song.id
      flash[:notice] = "bruh you created a yung new new song called #{@song.title} by #{@song.artist}"
      redirect_to songs_path
    else
      flash.now[:errors] = "BRUH!"
      render :new
    end
  end

  def edit
  end

  def update
    if @song.update(song_params)
      redirect_to @song
    else
      flash.now[:errors] = @song.errors.full_messages.join(",")
      render :edit
    end
  end

  def destroy
    song = Song.find(params[:id])
    song.destroy
    redirect_to songs_path
  end

  private
  def set_song
    @song = Song.find(params[:id])
  end
  def song_params
    params.require(:song).permit(:title, :artist)
  end
end
