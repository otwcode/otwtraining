class Comment < ActiveRecord::Base
  belongs_to :post
  validates_length_of :body, :minimum => 1, :too_short =>"Please do not leave an empty comment!"
  
end
