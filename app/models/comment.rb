# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post
  has_many :likes, as: :entity, dependent: :destroy
end
