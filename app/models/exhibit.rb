class Exhibit < ActiveRecord::Base
  belongs_to :museum, inverse_of: :exhibits

  def to_s
    name + " " + start_at.to_s("%m-%d") + "-" + end_at.to_s("%m-%d")
  end
end
