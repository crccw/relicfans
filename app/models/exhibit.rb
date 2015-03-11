class Exhibit < ActiveRecord::Base
  belongs_to :museum, inverse_of: :exhibits
  
  def to_s
    if start_at.nil? 
      return name + " " + location + "常设"
    else
      return name + " " + location + start_at.to_s(:num_short) + "/" +
          end_at.to_s(:num_short)
    end
  end
end
