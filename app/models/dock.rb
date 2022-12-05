# == Schema Information
#
# Table name: docks
#
#  id            :integer          not null, primary key
#  address       :string
#  comment_docks :text
#  description   :text
#  dock_renters  :integer
#  image         :string
#  owner         :integer
#  price         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Dock < ApplicationRecord
  validates :address, :presence => true
  validates :price, :presence => true
  validates :image, :presence => true
  
  belongs_to(:lessor, { :required => true, :class_name => "Owner", :foreign_key => "owner" })

  belongs_to(:leasee, { :class_name => "Renter", :foreign_key => "dock_renters" })


end
