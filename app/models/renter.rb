# == Schema Information
#
# Table name: renters
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  renter_comment  :text
#  renter_username :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Renter < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
end
