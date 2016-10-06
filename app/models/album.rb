# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  band_id    :integer          not null
#  recording  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#

class Album < ApplicationRecord
  validates :name, :band_id, presence: true

  belongs_to :band
  has_many :tracks, dependent: :destroy
end
