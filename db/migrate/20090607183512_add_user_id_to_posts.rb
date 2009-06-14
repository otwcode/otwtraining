class AddUserIdToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :user_id, :integer
    Post.reset_column_information
    Post.all.each do |post|
      post.update_attribute(:user_id,1)
      end
    add_column :comments, :user_id, :integer
    Comment.reset_column_information
    Comment.all.each do |comment|
      comment.update_attribute(:user_id,1)
      end
  end

  def self.down
    remove_column :posts, :user_id
    remove_column :comments, :user_id
  end
end
