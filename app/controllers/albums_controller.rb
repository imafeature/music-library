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
  end

  # GET /albums/new
  def new
    @album = Album.new
    @label = Label.new
    @labels = Label.all.map{ |l| [ l.name, l.id ] }
  end

  # GET /albums/1/edit
  def edit
  end

  # POST /albums
  # POST /albums.json
  def create
    label_params = {:name => params[:new_label]}

    @labels = Label.all
    @label = Label.new(label_params)
    @album = Album.new(album_params) 

    # if Label.exists?(:name => params[:new_label])
    #   @label = Label.where(:name => label_params[:name]).first
    #   @album.label_id = @label.id
    # end   

    if @label.save(validate: false)   
      @album.label_id = @label.id
      if @album.save
        redirect_to @album
      else
        render 'new'
      end
    else
      render 'new'
    end

  end

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
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

    def set_label
      @album = Album.find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:label, :label_id, :title, :artist, :genre, :year, :added, :plays, :label_attributes => [:label, :id, :name])
    end
end
