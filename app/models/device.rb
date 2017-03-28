class Device < ApplicationRecord
  belongs_to :user
  has_many :datums
end
