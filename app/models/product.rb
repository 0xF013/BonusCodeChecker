class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  #extract AT and RTG into constants if their number grows
  validates :service_name, inclusion: { in: %w(local at rtg) }

  # if more models depends on the codes being local or remote
  # refactor the product into STI
  # e.g. LocalProduct with has_many :codes
  # and RemoteProduct with :service_name
  has_many :codes

  def code_validation_strategy
    service_name.to_sym
  end
end
