require 'rails_helper'

describe User do
  it "Successfully create user in DB" do
    user = User.new(name: "Creator", email: "creator@gmail.com", password: "123123123")
    expect(user.new_record?).to be true
  end
end
