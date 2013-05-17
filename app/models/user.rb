class User < ActiveRecord::Base

  include BCrypt

  has_many :rounds
  has_many :decks, :through => :rounds

  validates :email, :presence => true, :format => {:with =>  /\w[-._\w]*\w@\w[-._\w]*\w\.\w{2,3}/},
            :uniqueness => true
  validates :password, :presence => true
  validates_length_of :password, :minimum => 5
  before_save :encrypt

  def self.authenticate(email, password)
    user = User.find_by_email(email)

    return true if user && Password.new(user.password) == password
    false
  end

  def encrypt
    to_hash = self.password
    self.password = BCrypt::Password.create(to_hash)
  end

  def get_stats
    stats_array = []
    self.rounds.each do |round|
      stats_array << round.results
    end
    stats_array
  end
end
