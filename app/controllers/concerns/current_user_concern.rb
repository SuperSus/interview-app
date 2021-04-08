module CurrentUserConcern
  extend ActiveSupport::Concern

  def current_user
    super || guest_user
  end

  def guest_user
    guest = GuestUser.new
    guest.name= "Guest"
    guest.first_name= "Guest"
    guest.last_name= "Some",
    guest.email= "guest@example.com"
    guest
  end
end
