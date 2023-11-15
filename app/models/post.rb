# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :text
#  expires_on :date
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :integer
#
class Post < ApplicationRecord
  belongs_to(:board, :class_name=>"Board", :foreign_key=>"board_id")
  scope(:active, ->{where(expires_on: Time.now...)})
  scope(:expired, ->{where(expires_on: ...Time.now)})
  validates(:title, {:presence=>true})
  validates(:body, {:presence=>true})
  validates(:expires_on, {:presence=>true})
  validates(:board_id, {:presence=>true})
end
