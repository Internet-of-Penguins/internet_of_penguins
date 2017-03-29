class Device < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :datums
end
