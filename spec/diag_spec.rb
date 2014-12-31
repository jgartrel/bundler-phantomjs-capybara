require 'capybara'
require 'capybara/rspec'
require 'capybara/poltergeist'
Capybara.run_server = false
Capybara.javascript_driver = :poltergeist
Capybara.default_driver = :poltergeist

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, { :js_errors => true, :debug => false })
end

Capybara.app_host = 'http://www.google.com'
Capybara.default_wait_time = 15

describe "Testing Driver", :type => :feature do

  it "can access google" do
  end

  it "can make a simple query" do
    visit "/"
    fill_in "q", :with => "Capybara"
    click_button 'Google Search'
    expect(page).to have_content 'largest rodent'
  end
end

