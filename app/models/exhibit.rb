class Exhibit < ActiveRecord::Base
  belongs_to :museum, inverse_of: :exhibits
end
