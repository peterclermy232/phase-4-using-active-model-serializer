class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :year, :length, :director, :description, :poster_url, :category, :discount, :female_director

  def summaries
    movies = Movie.all
    render json: movies, each_serializer: MovieSummarySerializer
  end
end
