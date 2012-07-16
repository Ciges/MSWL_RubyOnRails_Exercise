class Post < ActiveRecord::Base
    attr_accessible :content, :title, :published
    validates :title, :content, :presence => true
    has_many :comments
    
    scope :published, where(:published => true)
    scope :draft, where(:published => false)
end
