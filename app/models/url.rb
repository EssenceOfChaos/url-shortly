class Url < ApplicationRecord
  # Shape of the url
  # t.string :original
  # t.string :shortened
  # t.string :title
  # t.integer :clicks, :default => 0

  validates :original, presence: true, on: :create
  validates_format_of :original, with: /\A(?:(?:http|https):\/\/)?([-a-zA-Z0-9.]{2,256}\.[a-z]{2,4})\b(?:\/[-a-zA-Z0-9@,!:%_\+.~#?&\/\/=]*)?\z/

  # before_create :shorten
  after_create :shorten

  # Shorten the origianl url to six randomly chosen alphanumeric chars
  # create an array containing 10 digits, 26 capital letters, 13 lowercase letters- 49 chars total
  # select 6 random alphanumeric characters with replacement- chance of collision 49^6
  def shorten
    # chars = ['0'..'9','A'..'Z','a'..'m'].map{|range| range.to_a}.flatten
    # self.shortened = 6.times.map{chars.sample}.join
    # use the id as the pointer to the original url
    self.shortened = self.id
  end

  # removes whitespaces before validating format of url
  def sanitize
    self.original.strip!
  end

end
