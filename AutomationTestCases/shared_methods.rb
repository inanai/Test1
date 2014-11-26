


def register browser, login, first_name, email
	browser.find_element(:link => 'Register').click
	browser.find_element(:id => 'user_login').send_keys login
	browser.find_element(:id => 'user_password').send_keys 'qwerty'
	browser.find_element(:id => 'user_password_confirmation').send_keys 'qwerty'
	browser.find_element(:id => 'user_firstname').send_keys first_name
	browser.find_element(:id => 'user_lastname').send_keys 'last name'
	browser.find_element(:id => 'user_mail').send_keys(email)
	browser.find_element(:name => 'commit').click
end



def logged_in?
	browser.find_element(:css => '#loggedas .user').text == login
end

def message_is? message
	browser.find_element(:id => 'flash_notice').text == message
end

def get_first_name
	browser.find_element(:id => 'user_firstname').text
end

def get_last_name
	browser.find_element(:id => 'user_latstname').text
end