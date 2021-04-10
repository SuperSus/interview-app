class Movie < ApplicationRecord
  extend FriendlyId

  MOVIE_CATEGORIES = %i[comedy horror detective action family crime thriller western fantasy history]
  enum category: MOVIE_CATEGORIES

  has_many :ratings
  friendly_id :title, use: :slugged

  def update_avg_rating
    with_lock do
      avg_rating = Rating.where(movie_id: id).average(:value)&.to_f
      update_attribute :avg_rating, avg_rating
    end
  end
end
