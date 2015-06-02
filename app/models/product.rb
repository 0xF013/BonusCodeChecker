class Product < ActiveRecord::Base
  #extract AT and RTG into constants if their number grows
  validates :service_name, inclusion: { in: [nil, :at, :rtg] }
  validates :name, presence: true
  validates :name, uniqueness: true

  # if more models depends on the codes being local or remote
  # refactor the product into STI
  has_many :codes

  def codes_preloaded?
    service_name.nil?
  end
end
