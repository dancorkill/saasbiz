class Vote < ActiveRecord::Base
  attr_accessible :direction, :post_id

  belongs_to :post
  counter_culture :post, :column_name => Proc.new {|model| "#{model.direction}_counter" }
end
