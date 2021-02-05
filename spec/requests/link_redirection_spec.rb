require "rails_helper"

RSpec.describe "Link redirection", type: :request do
  it "redirects users from the shortened link to the original link" do
    url = "https://guides.rubyonrails.org/active_record_validations.html#uniqueness"
    shortener = Shortener.new(url)
    link = shortener.generate_short_link

    get link.shortened_url

    expect(response).to redirect_to(link.original_url)
  end
end
