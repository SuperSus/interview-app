class Rating < ApplicationRecord
  after_save :update_movie_averrage_rating
  belongs_to :movie, dependent: :destroy
  belongs_to :user, dependent: :destroy
  validates_presence_of :movie, :user
  validates_inclusion_of :value, :in => 1..10

  private

  def update_movie_averrage_rating
    movie.update_rating
  end
end
