class Link < ApplicationRecord
  validates :lookup_code, :original_url, presence: true
  validates :lookup_code, uniqueness: true
  validate :original_url_format

  def original_url_format
    # begin
    uri = URI.parse(original_url || "")
    if uri.host.nil?
      errors.add(:original_url, "Invalid URL format")
    end
  end

  def shortened_url
    "http://localhost:3000/#{lookup_code}"
  end
end
