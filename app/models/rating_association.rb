# == Schema Information
#
# Table name: rating_associations
#
#  id            :integer          not null, primary key
#  rating_id     :integer
#  topic_id      :integer
#  post_id       :integer
#  rateable_id   :integer
#  rateable_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class RatingAssociation < ActiveRecord::Base
  belongs_to :rateable, polymorphic: true
  belongs_to :rating
end
