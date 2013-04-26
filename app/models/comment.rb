class Comment < ActiveRecord::Base
  attr_accessible :body, :commentable_id, :commentable_type, :title

  belongs_to :commentable, :polymorphic => true
  has_many :comments, :as => :commentable

  def post
  return @post if defined?(@post)
  @post = commentable.is_a?(Post) ? commentable : commentable.post
end

end
