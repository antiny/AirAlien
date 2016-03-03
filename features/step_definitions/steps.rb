Given /^I visit homepage$/ do
  visit new_user_registration_path
end

Given(/^I put username and password$/) do
  fill_in "user[fullname]", with: 'test@gmail.com'
  fill_in "user[email]", with: 'test@gmail.com'
  fill_in "user[password]", with: 'password123'
  fill_in "user[password_confirmation]", with: 'password123'
  click_on "Sign up"
end

Then(/^I will be logged in$/) do
  true
end

Then(/^I will be redirected to homepage$/) do
  # debugger
  # page.should have_content('AirAlien')
  expect(page).to have_content('AirAlien')
  # assert page.has_content?('AirAlien')
end