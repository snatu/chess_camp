class DefaultUser < ActiveRecord::Migration
  def up
    admin = User.new
    admin.username = "admin"
    admin.password = "secret"
    admin.password_confirmation = "secret"
    admin.role = "admin"
    admin.save!
  end

  def down
    admin = User.find_by_email "admin@example.com"
    User.delete admin
  end
end
