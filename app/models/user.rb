class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :ratings, dependent: :destroy

  validates_format_of :name, with: /\A[^0-9`!@#\$%\^&*+_=]+\z/

  def first_name
    self.name.split.first
  end

  def last_name
    self.name.split.last
  end
end
