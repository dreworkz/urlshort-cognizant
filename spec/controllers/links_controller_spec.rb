require "rails_helper"

RSpec.describe LinksController do
  it "can create a link provided by a user" do
    request.env["HTTP_ACCEPT"] = "text/javascript"

    url = "http://www.longwebsite.com/articles/very-long-article-example-1/"

    post :create, params: { link: { original_url: url } }
    link = assigns(:link)
    expect(link.original_url).to eq(url)
    expect(link.valid?).to be(true)
    expect(link.lookup_code.length).to eq(7)
    expect(link.persisted?).to be(true)
    expect(response).to render_template("create")
  end
end
