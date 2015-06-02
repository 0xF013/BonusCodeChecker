class Code < ActiveRecord::Base
  belongs_to :product

  validates :value, presence: true
  validates :value, uniqueness: true
end
