class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # User can be an event creator as well as an event guest
  # User can have many created events.  
  has_many :created_events, foreign_key: :creator_id, class_name: 'Event'

  # # User can have many event_guests.
  # has_many :event_guests, foreign_key: :attendee_id

  # # User can have many attended events through event_guests.
  # has_many :attended_events, through: :event_guests, source: :event

end
