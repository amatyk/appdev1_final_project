# == Schema Information
#
# Table name: owners
#
#  id              :integer          not null, primary key
#  email           :string
#  owner_username  :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Owner < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:docks, { :class_name => "Dock", :foreign_key => "owner", :dependent => :destroy })
end
