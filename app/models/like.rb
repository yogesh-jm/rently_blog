# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :entity, polymorphic: true
end
