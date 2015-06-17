class User < ActiveRecord::Base
  has_secure_password

  enum role: %w(user admin super_admin)
end
