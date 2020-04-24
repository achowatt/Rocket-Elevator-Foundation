require 'rails_helper'

RSpec.describe "User Login", :type => :feature do
    context "Enter the right email and password combination to sign in" do
        it "redirects you to the index" do
            visit 'users/sign_in'
            fill_in 'Email', with: 'foo'
            fill_in 'Password', with: 'foo' do
            expect(subject).to redirect_to(:index)
            expect(response).to have_http_status(:ok)
            end
        end
    end
end