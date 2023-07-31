class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # broadcasts_to -> (comment) {'comments'}
  after_create :broadcast_create
  after_update :broadcast_update
  after_destroy :broadcast_destroy

  # Your other model logic and validations...

  private

  def broadcast_create
    broadcast_action_to('comments', action: :prepend, target: 'comments', partial: 'comments/comment', locals: { comment: self })
  end

  def broadcast_update
    broadcast_replace_to('comments', partial: 'comments/comment', locals: { comment: self })
  end

  def broadcast_destroy
    broadcast_remove_to('comments', partial: 'comments/comment', locals: { comment: self })
  end
end
