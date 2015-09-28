class Rating < ActiveRecord::Base
  enum severity: [ :PG, :PG13, :R ]
  has_many :rating_associations
  belongs_to :rateable, polymorphic: true
  has_many :topics, through: :rating_associations, source: :rateable, source_type: :Topic
  has_many :posts, through: :rating_associations, source: :rateable, source_type: :Post

  def self.update_ratings(rating_string)
    new_ratings = []
    unless rating_string.nil? || rating_string.empty?
      rating_string.split(",").each do |rating|
      rating_severity = rating.strip
      new_rating = Rating.find_or_create_by(severity: rating_severity)
      new_ratings << new_rating
      end
    end
    new_ratings
  end
end
