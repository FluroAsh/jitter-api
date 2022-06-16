class Message < ApplicationRecord
  belongs_to :user
  validates_presence_of :text

  def transform_message
    # we can change the names of the keys and do other manipulations here
    # ... returning a new message object
    return {
      id: self.id,
      text: self.text,
      posted: self.updated_at,
      username: self.user.username # the user that wrote the message
    }
  end
end