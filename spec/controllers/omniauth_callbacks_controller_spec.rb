require 'spec_helper'
 
describe OmniauthCallbacksController, "handle google_oauth2 authentication callback" do

	describe "New User" do

		context "when google_oauth2 email doesn't exist in the system" do
			before(:each) do
				stub_env_for_omniauth
				get :google_oauth2
				@user = User.where(:email => "black@black.com").first
	 		end
	 		it {expect(@user).to be_nil}
		end
	end

	if User.count > 0
		 describe "Existing user" do	
			context "when google_oauth2 email already exist in the system" do
				before(:each) do
					stub_env_for_omniauth
					User.create(:email => "black@black.com", :password => "blackblack")
					@user = User.create(:email => "black@black.com", :password => "blackblack")
					get :google_oauth2
				end
				it { expect(@user.errors.full_messages).to include("Email is already taken") }
			end
		end
	end
end
describe "top page" do
	it "can handle authentication error" do
		#OmniAuth.config.mock_auth[:google_oauth2] = :invalid_credentials
		visit '/users/auth/google_oauth2/callback'
		click_link "Sign IN"
		page.should have_content('Sign in with Google Oauth2')
	end
end
def stub_env_for_omniauth
		request.env["devise.mapping"] = Devise.mappings[:user]
		request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2] 
end

