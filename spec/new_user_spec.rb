require 'rails_helper'

RSpec.describe "User Sign Up", :type => :feature do
    context "Enter email, password, and password comfirmation" do
        it "redirects you to the index" do
            visit 'users/sign_up'
            fill_in 'Email', with: 'foo'
            fill_in 'Password', with: 'foo' do
            expect(subject).to redirect_to(:index)
            expect(response).to have_http_status(:ok)
            end
        end
    end
end