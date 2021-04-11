class GuestUser < User
  # Do u really need attr_accessor here? (u can't modify this fields, since they are just virtual)
  attr_accessor :name, :first_name, :last_name
end
