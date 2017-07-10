class FeedsController < ApplicationController
  def index
    @feeds = Feed.paginate(page: params[:page], per_page: 3)
    respond_to do |format|
      format.html
      format.js { render 'feeds/s_feed' }
    end
  end

  def watch
    @feed = Feed.find_by(id: params[:feed_id])
  end

  private
    def req_latest_feeds

    end

    def share

    end
end
