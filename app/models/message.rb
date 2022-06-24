class Message < ApplicationRecord
    belongs_to :user
    validates_presence_of :text

    def transform_message 
        return {
            id: self.id,
            text: self.text,
            posted: self.updated_at,
            username: self.user.username
        }
    end
    
    # Self in this case is the Message object
    def self.find_by_user(username)
        # Get the user object from the database
        user = User.find_by(username: username)
        # Return the list of messages from a certain user
        pp user
        return self.where(user: user)
    end
end