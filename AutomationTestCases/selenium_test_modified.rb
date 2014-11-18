require 'selenium-webdriver'
require_relative 'shared_methods'

browser = Selenium::WebDriver.for :firefox
browser.get 'http://demo.redmine.org'

login = 'test_login_'+rand(36**10).to_s(36)
email = login + '@mail.test'
first_name = 'first_name'

register(browser, login, first_name, email)

fail 'Last name is not "last name"' unless get_la == 'last name'

sleep 2
fail 'Couldn\'t find success message' unless message_is? 'Your account has been activated. You can now log in.'
fail 'We are not logged in' unless logged_in?

if get_first_name != first_name
	fail "First name is not #{first_name}"
end

fail "Email is not #{email}" unless browser.find_element(:id => 'user_mail').text == email


browser.find_element(:id => 'user_firstname').send_keys('new' + first_name)
browser.find_element(:name => 'commit').click

fail 'Couldn\'t find success message' unless browser.find_element(:id => 'flash_notice').text == 'Account was successfully updated.'

browser.close
#"метод-find element", "класс-Selenium::WebDriver", "объект-browser", "переменная-browser"