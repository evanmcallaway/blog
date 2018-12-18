class Tag < ApplicationRecord
    has_many :taggings, dependent: :delete_all
    has_many :articles, through: :taggings
    scope :orphaned, -> { left_outer_joins(:taggings).where('taggings.id IS NULL') }
end
