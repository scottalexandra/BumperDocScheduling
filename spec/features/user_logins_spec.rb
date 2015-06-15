require 'rails_helper'

RSpec.feature "UserLogins", type: :feature do
  
  it "can login from home page" do
    visit root_path
    click_link_or_button "Log In"
    expect(current_path).to eq(login_path)
    expect(page).to have_content("An app by DevBoutique")
  end

  it "can login from the home page" do
    visit root_path
    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: user.password
    click_link_or_button "Log In"
    expect(current_path).to eq(schedule_index_path)
  end
end
