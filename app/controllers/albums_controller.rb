class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  # GET /albums
  # GET /albums.json
  def index
    @albums = Album.all
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
    @artist = @album.artist
  end

  # GET /albums/new
  def new
    @album = Album.new
    @artist = Artist.new
    @label = Label.new
    @labels = Label.all.map{ |l| [ l.name, l.id ] }
  end

  # GET /albums/1/edit
  def edit 
    @album = Album.find(params[:id])
    @artist = @album.artist || Artist.new
    @label = @album.label || Label.new
    @labels = Label.all.map{ |l| [ l.name, l.id ] }
  end

  # POST /albums
  # POST /albums.json
  def create
    label_params = {:name => params[:new_label]}
    artist_params = {:name => params[:artist_name]}

    @labels = Label.all
    @label = Label.new(label_params)
    @artist = Artist.new(artist_params)
    @album = Album.new(album_params) 

    if @label.name != ''
      if Label.exists?(:name => label_params[:name])
        @label = Label.where(:name => label_params[:name]).first
        @album.label = @label
      else
        @album.label = @label
      end 
    end    

    if @artist.name != ''
      if Artist.exists?(:name => artist_params[:name])
        @artist = Artist.where(:name => artist_params[:name]).first
        @album.artist = @artist
      else
        @album.artist = @artist
      end  
    end

    if Album.exists?(:title => album_params[:title])  
      if Album.exists?(:artist => album_params[:artist])  
        @album = Album.where(:title => album_params[:title], :artist => album_params[:artist]).first
        redirect_to @album and return
      end
    end

    if @album.save
      redirect_to @album and return
    else
      render 'new' and return
    end
    
  end



  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def update

    label_params = {:name => params[:new_label]}
    artist_params = {:name => params[:artist_name]}

    @labels = Label.all
    @label = (@album.label.nil?) ? Label.new(label_params) : @album.label
    @artist = (@album.artist.nil?) ? Artist.new(artist_params) : @album.artist 

    if Label.exists?(:name => label_params[:name])
      @label = Label.where(:name => label_params[:name]).first
      @album.label_id = @label.id
    else
      @label.save
      @album.label_id = @label.id
    end   

    if Artist.exists?(:name => artist_params[:name])
      @artist = Artist.where(:name => artist_params[:name]).first
      @album.artist = @artist
    else
      @artist.save
      @album.artist = @artist
    end
    
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit }
        format.json { render json: [@album.errors, @album.artist.errors, @album.label.errors], status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @albums = Album.all
    @album = Album.find(params[:id])
    @album.destroy
  
    respond_to do |format|
      format.html { redirect_to albums_url, notice: 'Album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:user, :user_id, :label, :label_id, :title, :artist, :artist_id, :genre, :year, :added, :plays, :label_attributes => [:label, :id, :name], :artist_attributes => [:id, :artist_id, :name])
    end
end
