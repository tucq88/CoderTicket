class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category
  has_many :ticket_types
  belongs_to :user

  validates_presence_of :name, :extended_html_description, :venue, :category, :starts_at
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}

  def self.future
    where('starts_at > ?', DateTime.now)
  end

end
