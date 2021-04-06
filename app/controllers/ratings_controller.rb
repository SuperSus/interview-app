class RatingsController < ApplicationController
  before_action :set_movie

  def create
    @rating = @movie.ratings.new({
      value: params[:value],
      movie_id: @movie.id,
      user_id: current_user.id
    })

    #if @rating.save
      #redirect_to movie_ratings_path(@movie), :notice => "Rating successful."
    #else
      #redirect_to movie_ratings_path(@movie), :notice => "Something went wrong."
    #end
  end

  def update
    @rating = Rating.find(params[:id])
    @rating.update_attribute :value, params[:value]
  end

  private

  def set_movie
    @movie = Movie.find(parms[:movie_id])
  end
end
