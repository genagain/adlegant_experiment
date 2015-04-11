require "rails_helper"

feature "User submits an article and then deletes it" do
  scenario "User deletes article" do
    visit root_path
    fill_in "Link", with: "http://www.theverge.com/2014/11/26/7292895/best-black-friday-deals"
    click_button "Add Article"
  end
end
