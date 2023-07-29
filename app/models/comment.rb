class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  broadcasts_to -> (comment) {'comments'}
end
