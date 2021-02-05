require "digest/sha2"

class Shortener
  attr_reader :url, :link_model

  def initialize(url, link_model = Link)
    @url = url
    @link_model = link_model
  end

  def generate_short_link
    link_model.create(original_url: url, lookup_code: lookup_code)
  end

  def lookup_code
    # get lookup code from url
    # check if it already exists
    # break out of loop if it does not exist
    # if exists, generate another code
    loop do
      code = get_new_code
      break code unless link_model.exists?(lookup_code: code)
    end
  end

  private

  def get_new_code
    SecureRandom.uuid[0..6]
  end
end
