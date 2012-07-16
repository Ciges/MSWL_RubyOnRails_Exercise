class Post < ActiveRecord::Base
    attr_accessible :content, :title, :published, :author_id
    validates :title, :content, :presence => true
    has_many :comments
    belongs_to :author
    
    scope :published, where(:published => true)
    scope :draft, where(:published => false)
end
