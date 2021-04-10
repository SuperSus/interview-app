# frozen_string_literal: true

class ExampleReflex < ApplicationReflex
  delegate :current_user, to: :connection

  def update_rating
    ActiveRecord::Base.transaction do
      @movie = Movie.find(element.dataset[:movie_id])
      rating = Rating.find_or_create_by( { user_id: current_user.id, movie_id: @movie.id  } ) do |rating|
        rating.value = element.dataset[:value]
      end

      unless rating.value.to_s == element.dataset[:value]&.to_s
        rating.update_attribute :value, element.dataset[:value]
      end

      @movie.update_avg_rating
    end
  end
end
