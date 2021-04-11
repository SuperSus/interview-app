class Rating < ApplicationRecord
  belongs_to :movie, dependent: :destroy
  belongs_to :user, dependent: :destroy
  validates_presence_of :movie, :user
  validates_inclusion_of :value, :in => 1..10
end
