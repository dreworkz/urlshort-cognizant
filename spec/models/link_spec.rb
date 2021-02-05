require "rails_helper"

RSpec.describe Link, type: :model do
  it "is valid if it has an original URL and lookup code" do
    link = Link.new(
      original_url: "http://www.longwebsite.com/articles/very-long-article-example-1/",
      lookup_code: "1234567",
    )
    expect(link.valid?).to be(true)
  end

  it "is invalid if the input is not a proper URL" do
    link = Link.new(
      original_url: "asdsad",
      lookup_code: "1234567",
    )
    expect(link.valid?).to be(false)
  end

  it "is invalid if it does not have a lookup code" do
    link = Link.new(
      original_url: "http://www.longwebsite.com/articles/very-long-article-example-1/",
    )
    expect(link.valid?).to be(false)
  end

  it "is invalid if it does not have an original URL" do
    link = Link.new(
      lookup_code: "1234567",
    )
    expect(link.valid?).to be(false)
  end

  it "is invalid if lookup code already exists" do
    link1 = Link.new(
      original_url: "http://www.longwebsite.com/articles/very-long-article-example-1/",
      lookup_code: "1234567",
    )
    link1.save

    link2 = Link.new(
      original_url: "http://www.longwebsite.com/articles/very-long-article-example-2/",
      lookup_code: "1234567",
    )
    expect(link2.valid?).to be(false)
  end
end
