class SearchController < ApplicationController
  before_action :authenticate_user!,:lastfm_init

  def index
    if params[:search]
      @artists = @lastfm.artist.search(artist: params[:search])['results']['artistmatches']['artist']
    end
  end

  private

    def lastfm_init
      unless @lastfm
        lastfm ||= Lastfm.new('b8a8da7b4164232fa03f4930f827112b', '6ce62a3647fb7a2c1422051d8b65eaee')
        token ||= '95ff39af37f0c4b4e1fa0725ac8fe5fe'
        lastfm.session ||= lastfm.auth.get_session(token: token)['key']
        @lastfm = lastfm
      end
    end
end
