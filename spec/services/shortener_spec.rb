require "rails_helper"

RSpec.describe Shortener do
  it "shortens a URL to 7char" do
    url = "http://www.longwebsite.com/articles/very-long-article-example-1/"
    shortener = Shortener.new(url)
    expect(shortener.lookup_code.length).to eq(7)
  end

  it "returns a unique URL for each link" do
    url = "http://www.longwebsite.com/articles/very-long-article-example-1/"
    shortener = Shortener.new(url)
    link1 = shortener.lookup_code

    url = "http://www.longwebsite.com/articles/very-long-article-example-2/"
    shortener = Shortener.new(url)
    link2 = shortener.lookup_code

    expect(link1).not_to eq(link2)
  end

  # it "returns the same URL for the same link" do
  #     url="http://www.longwebsite.com/articles/very-long-article-example-1/"
  #     shortener = Shortener.new(url)
  #     firstTry = shortener.lookup_code

  #     url="http://www.longwebsite.com/articles/very-long-article-example-1/"
  #     shortener = Shortener.new(url)
  #     secondTry = shortener.lookup_code

  #     expect(firstTry).to eq(secondTry)
  # end

  it "generates a Link record with a unique lookup code" do
    url = "http://www.longwebsite.com/articles/very-long-article-example-1/"
    shortener = Shortener.new(url)

    link1 = shortener.generate_short_link
    expect(link1.valid?).to be(true)

    link2 = shortener.generate_short_link
    expect(link2.valid?).to be(true)
  end
end
