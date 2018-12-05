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
  # select 6 random alphanumeric characters with replacement
  def shorten
    # chars = ['0'..'9','A'..'Z','a'..'m'].map{|range| range.to_a}.flatten
    # self.shortened = 6.times.map{chars.sample}.join
    # use the id as the pointer to the original url
    hashMap = {
      1=> 'a', 2=> 'b', 3=> 'c', 4=> 'd', 5=> 'e', 6=> 'f', 7=> 'g', 8=> 'h', 9=> 'i', 10=> 'j', 11=> 'k',
      12=> 'l', 13=> 'm', 14=> 'n', 15=> 'o', 16=> 'p', 17=> 'q', 18=> 'r', 19=> 's', 20=> 't', 21=> 'u',
      22=> 'v', 23=> 'w', 24=> 'x', 25=> 'y', 26=> 'z', 27=> 'A', 28=> 'B', 29=> 'C', 30=> 'D', 31=> 'E',
      32=> 'F', 33=> 'G', 34=> 'H', 35=> 'I', 36=> 'J', 37=> 'K', 38=> 'L', 39=> 'M', 40=> 'N', 41=> 'O',
      42=> 'P', 43=> 'Q', 44=> 'R', 45=> 'S', 46=> 'T', 47=> 'U', 48=> 'V', 49=> 'W', 50=> 'X', 51=> 'Y',
      52=> 'Z', 53=> 1, 54=> 2, 55=> 3, 56=> 4, 57=> 5, 58=> 6, 59=> 7, 60=> 8, 61=> 9, 62=> 0
    }
    if self.id < 62
      self.shortened = hashMap[self.id]
    else
      self.shortened = self.id
    end
  end

  # removes whitespaces before validating format of url
  def sanitize
    self.original.strip!
  end

end
