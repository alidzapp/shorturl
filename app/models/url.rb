class Url < ActiveRecord::Base
  attr_accessible :shurl, :slug
  
  validates :shurl, presence: true
  validates :slug, uniqueness: true

  after_create :generate_slug

  def generate_slug
    update_attributes(:slug => SecureRandom.base64(2))
  end

  def lurl
    return shurl if shurl.blank?

    if shurl.match(/^http/)
      shurl
    else
      "http://#{shurl}"
    end 
  end
end
