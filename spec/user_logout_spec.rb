require 'rails_helper'

RSpec.describe "User Sign out", :type => :feature do
    context "First user has to be signed in, then when they click on log out" do
        it "returns sign user out" do
            visit new_user_session_path
            fill_in 'Email', with: 'foo'
            fill_in 'Password', with: 'foo' do
                visit destroy_user_session_path
                click_button "Logout" do
                    expect(page).to have_text('Login')
                    expect(page).to redirect_to(:index)
                    xpect(page).to have_http_status(:ok)
                end
            end
        end
    end
end


