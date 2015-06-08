class HistoryController < ApplicationController
  def index
    @searches = current_user.searches
  end
end
