class SearchController < ApplicationController
  before_action :authenticate_user!,:set_lastfm

  def index
    if params[:search]
      @top_tracks = @lastfm.artist.get_top_tracks(artist: params[:search])
      @artists = @lastfm.artist.search(artist: params[:search])['results']['artistmatches']['artist']
      current_user.searches.create(history: params[:search])
    end
  end

  private

    def set_lastfm
      @lastfm ||= Lastfm.new('b8a8da7b4164232fa03f4930f827112b', '6ce62a3647fb7a2c1422051d8b65eaee')
    end
end
