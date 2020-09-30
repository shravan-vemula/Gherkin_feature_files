Feature: user can login to the real world app 

    User can login in to the application with a valid username and password

    Background: 
        Given a user named "Shravan"
        And Shravan has registered for this application
        And Shravan's user name is "shravan_vemula"
        And Shravan's password is "s3cret"

    Scenario: Shravan cannot give empty username
        When I don't give username in the textfield
        Then a warning message "username is required" is displayed
        And "Sign in" button won't be enabled
    
    Scenario: Shravan cannot give empty password
        Given I have entered my username
        When I don't give password in the textfield
        Then "Sign in" button won't be enabled

    Scenario Outline: Shravan cannot login with invalid credentials
        When I gave my username as <username>
        And my password as <password>
        And Click on "Sign in" button
        Then I should get a warning "Invalid username/password" 

        Examples:
            | username | password | 
            |  shravan |  12345   |
            |  vemula  |  12345   |

    Scenario: Shravan can login with valid credentials
        When I gave my username as "shravan_vemula"
        And my password as "s3cret"
        And Click on "Sign in" button
        Then I should be able to login to the application 
    



    
    