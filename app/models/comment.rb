class Comment < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :post

  
end