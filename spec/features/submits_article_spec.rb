require "rails_helper"

feature "User submits article and see the organized content" do
  scenario "User submits article" do
    visit root_path
    fill_in "Link", with: "http://www.theverge.com/2014/11/26/7292895/best-black-friday-deals"
    click_button "Add Article"
    expect(page).to have_content("The 20 best Black Friday deals")
    expect(page).to have_content("Verge Staff")
    summary = """
    That said, here are the 20 best Black Friday deals this year.
    Black Friday is right around the corner, and there are plenty of great deals to be had.
    We've been covering the deals for weeks now, but if you want to cut through the mess and just score the best deals you can find, you've come to the right place.
    Keep in mind that the best deals won't last long and many of them are limited to Friday itself (or in rare occasions, Thursday too).
    To win the Black Friday game, you have to be aggressive and quick, there's no time to sleep when deals are to be had.
    """
    expect(page).to have_content(summary)
    expect(page).to have_content("money, laptop, weekend, tvs, time, good, tablets, year ipads, black friday, best black, best deals")
  end
end
