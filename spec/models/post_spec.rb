require "rails_helper"

describe Post do
  it "Check empty field" do
    post = Post.new(title: "Not empty", body: "Not empty:")
    expect(:title).not_to be_empty
    expect(:body).not_to be_empty
  end

  it "Check length title" do
    post = Post.new(title: "Not empty", body: "Not empty")
    expect(:title).to have_at_least(1).items
    expect(:title).to have_at_most(80).items
  end
end
