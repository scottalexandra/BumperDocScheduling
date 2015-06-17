require 'rails_helper'

RSpec.feature "UserLogins", type: :feature do
  let(:user) { create(:user) }

  it "can login from home page" do
    visit root_path
    expect(page).to have_content("BumperDoc Denver Scheduling Portal")
  end

  it "can login from the home page" do
    visit root_path
    fill_in "sessions[email]", with: user.email
    fill_in "sessions[password]", with: user.password
    click_link_or_button "Log In"
    expect(current_path).to eq(job_index_path)
    expect(page).to have_content("Welcome #{user.username}")
  end
end
