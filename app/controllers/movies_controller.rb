class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]

  def index
    category = query_params[:category]
    scope = if Movie::MOVIE_CATEGORIES.include?(category&.to_sym)
              Movie.send(category)
            else
              Movie.all
            end

    @movies = scope.order(:id).page(params[:page]).per(5)
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def edit
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to @movie, notice: "Movie was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @movie.update(movie_params)
      redirect_to @movie, notice: "Movie was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @movie.destroy
    redirect_to root_url, notice: "Movie was successfully destroyed."
  end

  private
    def set_movie
      @movie = Movie.friendly.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :text, :category)
    end

    def query_params
      query_params = params[:query]
      query_params ? query_params.permit(:category) : {}
    end
end
