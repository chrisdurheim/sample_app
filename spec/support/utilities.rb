include ApplicationHelper

def full_title(page_title)
	base_title = "Ruby on Rails Tutorial Sample App"
	if page_title.empty?
		base_title
	else
		"#{base_title} | #{page_title}"
	end
end

RSpec::Matchers.define :have_error_message do |message|
	match do |page|
		page.should have_selector('div.alert.alert-error', text: message)
	end
end

def sign_in(user)
	visit signin_path
	fill_in "Email", 	with: user.email
	fill_in "Password", with: user.password
	click_button "Sign in"
	# Sign in when not using Capybara as well
	cookies[:remember_token] = user.remember_token
end

def fill_signup_valid_info
	fill_in "Name", 		with: "Example User"
	fill_in "Email",		with: "user@example.com"
	fill_in "Password",		with: "foobar"
	fill_in "Confirmation",	with: "foobar"	
end

def fill_signup_name_too_long
	fill_signup_valid_info
	fill_in "Name", 		with: 'a'*51
end

def	fill_signup_password_mismatch
	fill_signup_valid_info
	fill_in "Confirmation", with: "foobarz"
end