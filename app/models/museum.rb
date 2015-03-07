class Museum < ActiveRecord::Base
  has_many :exhibits, inverse_of: :museum
end
