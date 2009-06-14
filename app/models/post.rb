class Post < ActiveRecord::Base
has_many :comments

validates_length_of :title, :within => 3..30, :too_long => "Please insert a title shorter than 30 characters!", :too_short => "Please insert a title longer than 3 characters!"
validates_length_of :body, :minimum => 1, :too_short => "Please don't leave the post body empty!"


end
