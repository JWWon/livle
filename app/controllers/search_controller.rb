class SearchController < ApplicationController
  def index
    render_by_device
  end

  # keyword : feed.title, upcoming.title, artist.name, user.nickname, upcoming.place
  def search
    term = params[:term]

    @video_results = Searchkick.search(
      term,
      index_name: [Feed, Curation],
      fields: [:artists_names, :title, :user_nickname],
      operator: "or",
      match: :word_middle
    )
    @upcoming_results = Upcoming.search(
      term,
      fields: [:artists_names, :title, :place],
      operator: "or",
      match: :word_middle
    )

    render_by_device
  end
end
