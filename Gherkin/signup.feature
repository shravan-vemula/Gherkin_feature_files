Feature: user can sign up to the real world app 

    User can register to the real world app by giving his firstname,lastname
    username and password

    Background: 
        Given a user named "Shravan"
        And Shravan has not registered to this application before

    Scenario Outline: Shravan cannot leave fields empty
        When I don't give <field_name> in the textfield
        Then a warning message <warning> is displayed
        And "SIGN UP" button won't be enabled

        Examples:
            |   field_name      |         warning           |
            |   firstname       |  First Name is required   |
            |   lastname        |  Last Name is required    |
            |   username        |  Username is required     |
            |   password        |   Enter your password     |
            | confirm-password  |  confirm your password    |


    Scenario Outline: Shravan cannot give a password less than 4 characters
        When I gave my password as <password>
        Then I should get a warning "Password must contain at least 4 characters" 

        Examples:
            | password | 
            |    123   |
            |    456   |

    Scenario Outline: Shravan should give confirm password same as password
        When I gave my password as <password>
        And I gave my password as <confirm-password>
        Then I should get a warning "Password does not match"

          Examples:
            | password  |    confirm-password    | 
            |    1234   |        1235            |         
            |    4567   |        4568            |

    Scenario: Shravan can see the "SIGN UP" button enabled after giving valid details
        When I gave my firstname as "shravan"
        And lastname as "vemula"
        And username as "shravan_vemula"
        And password as "s3cret"
        And confirm-password as "s3cret"
        Then I should see "SIGN UP" button enabled 

    Scenario: Shravan can sign up into the application after filling details
        When I gave valid details in the fields
        And I click on "SIGN UP" button
        Then I should be able to sign up into the application
      