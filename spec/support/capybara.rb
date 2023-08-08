require 'webdrivers'

# Temporary fix for https://github.com/titusfortner/webdrivers/issues/247
Webdrivers::Chromedriver.required_version = "114.0.5735.90"

Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new

  # Chrome won't work properly in a Docker container in sandbox mode
  options.add_argument("no-sandbox")

  # Run headless by default unless CHROME_HEADLESS specified
  options.add_argument("headless") unless ENV['CHROME_HEADLESS'] =~ /^(false|no|0)$/i

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: options
  )
end

Capybara.javascript_driver = :chrome
