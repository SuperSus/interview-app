class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:admin, :voter], multiple: true)                                      ##
  ############################################################################################


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :ratings, dependent: :destroy
  
  validates_format_of :name, with: /\A[^0-9`!@#\$%\^&*+_=]+\z/
  
  # OPTIONAl: use two separate columns (first_name, last_name) instead of 'name'
  def first_name
    self.name.split.first
  end

  def last_name
    self.name.split.last
  end
end
