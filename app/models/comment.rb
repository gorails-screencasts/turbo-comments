class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true

  has_many :comments, as: :commentable, dependent: :destroy

  after_create_commit -> { broadcast_prepend_later_to commentable, target: ActionView::RecordIdentifier.dom_id(commentable, :comments), partial: "comments/comment_with_replies", locals: {comment: self}}
  after_update_commit -> { broadcast_replace_later }
  #after_destroy_commit -> { broadcast_remove }
  after_destroy_commit -> { broadcast_remove_to self, target: ActionView::RecordIdentifier.dom_id(self, :with_replies) }
end
