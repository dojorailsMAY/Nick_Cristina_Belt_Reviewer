class Event < ActiveRecord::Base
  belongs_to :user
  has_many :messages
  has_many :attendings
  has_many :attending_users, through: :attendings, source: :user
end
