Feature: User can add bank accounts in the application
    
    Background: 
        Given a user named "Shravan"
        And Shravan logged into the Real world App
        And Shravan has two bank accounts 
    

    Scenario: Shravan can select create account to fill the details
        When I click on the "Bank Accounts" tab
        Then I should see "CREATE" button to create the account

    Scenario Outline: Shravan cannot give invalid bank name  while filling the details
        When I give <name> as a bank name
        Then I should see a warning to give a name that contains atleast 5 characters

        Examples:
            |   name   |
            |   SMI    |
            |   TUV    |

      Scenario Outline: Shravan cannot give invalid routing number while filling the details  
        When I give <number> as a routing number
        Then I should see a warning to give a valid routing number 

        Examples:
            |   number   |
            |   56476    |
            |   546345   |

      
      Scenario Outline: Shravan cannot give invalid account number while filling the details  
        When I give <number> as an account number
        Then I should see a warning to give a valid account number

        Examples:
            |   number   |
            |   56476    |
            |   546345   |


    Scenario Outline: Shravan can create an account with valid account details
        When I give <name> as a bank name
        And <routing_number> as a routing number
        And <account_number> as an account number
        And I click on the "Save" button
        Then accont will be created with the given details

        Examples:
            |   name   |  rounting_number   |   account_number  |
            |   ICICI  |    1234567894      |     123456789     |
            |   Kotak  |    5678941234     |      567891234     |
           
    
   

    