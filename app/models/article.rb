class Article < ApplicationRecord
    validates :title, presence: true, length: { minimum: 5 }
    validates :body, presence: true, length: { minimum: 15 }

    has_many :taggings, dependent: :delete_all
    has_many :tags, through: :taggings

    scope :tagged, -> (tag){ joins(:tags).where(tags: { name: tag}) if tag }

    def tags_string
        tags.map(&:name).join(', ')
    end

    def tags_string=(tags_string)
        self.tags = tags_string.to_s.split(',').map do |tag_string|
            Tag.where(name: tag_string.strip).first_or_create!
        end
        Tag.orphaned.map(&:destroy)
    end
end
