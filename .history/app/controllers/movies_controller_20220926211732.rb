class MoviesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    movies = Movie.all
    render json: movies
  end

  def show
  movie = Movie.find(params[:id])
  render json: movie
   #render json: movie.to_json(except: [:created_at, :updated_at])
  # post = Post.find(params[:id])
  #render json: post.to_json(only: [:title, :description, :id], include: [author: { only: [:name]}])
  end

  private

  def render_not_found_response
    render json: { error: "Movie not found" }, status: :not_found
  end
end
