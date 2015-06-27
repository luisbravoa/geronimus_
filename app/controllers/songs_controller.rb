require 'pathname'
class SongsController < ApplicationController

  layout false

  before_action :confirm_logged_in


  def index

  end

  def list
    user = User.find_by_id(@user_id);
    render json: user.songs.to_json(json_config)
  end


  # before_filter only: :create do
  #   unless @json.has_key?('song')
  #     render nothing: true, status: :bad_request
  #   end
  # end

  def create
    user = User.find_by_id(@user_id);
    uploaded_io = params[:file]


    user_directory = File.join('public', 'songs', user.id.to_s)

    # create user directory if it does not extist
    Dir.mkdir(File.join('public', 'songs', user.id.to_s), 0700) unless Dir.exists?(File.join('public', 'songs', user.id.to_s))

    file_name = uploaded_io.original_filename

    file_path = File.join(user_directory, file_name)

    ## change the name if it already exists
    count = 1
    while File.exists?(file_path) do
        puts file_path
        file_name = File.basename(uploaded_io.original_filename) + " (" + count.to_s + ")" + File.extname(uploaded_io.original_filename)
        file_path = File.join(user_directory, file_name)
        count += 1
      end

      # move file to user dir
      File.open(file_path, 'wb') do |file|
        file.write(uploaded_io.read)
      end

      user.add_song(file_name, get_metadata(file_path))

      render "index"

    end

    def show
    	render json: Song.find_by_id(params[:id]).to_json(json_config)
    end


    def update

    end

    private

    def parse_request
      @json = JSON.parse(request.body.read) if request.body.read.length > 0
    end


    private
    def get_metadata (path)
      require "mp3info"

      Mp3Info.open(path) do |mp3|
        return mp3.tag
      end
    end

    def json_config
    	return :include => {:album => {:only =>[:id, :name]}, :artist => {:only =>[:id, :name]}}, :only => [ :id, :title, :file ] 
    end

  end
