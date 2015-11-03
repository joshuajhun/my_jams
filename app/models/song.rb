class Song < ActiveRecord::Base
  validates_presence_of :title, :artist
  belongs_to :user
end
