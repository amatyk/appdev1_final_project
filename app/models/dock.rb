# == Schema Information
#
# Table name: docks
#
#  id           :integer          not null, primary key
#  address      :string
#  dock_renters :integer
#  image        :string
#  owner        :integer
#  price        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Dock < ApplicationRecord
end
