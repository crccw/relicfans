class Exhibit < ActiveRecord::Base
  belongs_to :museum, inverse_of: :exhibits

  def to_s
    [museum.name, name, start_at.to_s(:short), end_at.to_s(:short)].join(" ")
  end
end
