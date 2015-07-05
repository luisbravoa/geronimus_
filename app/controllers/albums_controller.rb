class AlbumsController < ApplicationController

  layout false

  before_action :confirm_logged_in

  def list
    render json: @user.albums.to_json(json_config)
  end
  def show
    render json: @user.albums.find(params[:id]).to_json(json_config)
  end

  private
  def json_config
    return :only =>[:id, :name, :artist], :include => {:artist => {:only =>[:id, :name]}}
  end
  
end
