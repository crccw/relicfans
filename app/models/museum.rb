class Museum < ActiveRecord::Base
  has_many :exhibits, inverse_of: :museum

  def to_s
    "#{name}\n" + exhibits.map(&:to_s).join("\n")
  end
end
