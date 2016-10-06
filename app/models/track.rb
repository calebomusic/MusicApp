# == Schema Information
#
# Table name: tracks
#
#  id       :integer          not null, primary key
#  name     :string           not null
#  album_id :integer          not null
#  kind     :string
#  lyrics   :text
#

class Track < ApplicationRecord
  validates :album_id, :name, presence: true

  belongs_to :album
  has_one :band,
    through: :album,
    source: :band
end
