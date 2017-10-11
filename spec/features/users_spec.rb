describe "test", type: :feature do
  describe "User" do
    let!(:user)  { FactoryGirl.create(:user) }
    it "When user sign in successful" do
      visit login_path
      fill_in("Name", with: "Ronnie")
      fill_in("Email", with: "ronnie@gmail.com")
      fill_in("Password", with: "qwerty123")
      click_button("Login")
      expect(page).to have_content "Login successful"
    end
  end
end
