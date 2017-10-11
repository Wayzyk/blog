require 'rails_helper'

describe "test", type: :feature do
  describe "Post" do
    visit login_path
    fill_in("Title", with: "Not empty")
    fill_in("Body", with: "Not empty")
    click_button "Submit"
    visit post_path
  end
end
