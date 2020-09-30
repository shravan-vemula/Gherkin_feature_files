Feature: User can delete bank accounts in the application
    
    Background: 
        Given a user named "Shravan"
        And Shravan logged into the Real world App
        And Shravan has two bank accounts added in the application 
    

    Scenario Outline: Shravan can see his bank accounts 
        When I click on the "Bank Accounts" tab
        Then I should see <bank_name> in the accounts list

         Examples:
            |   bank_name   |
            |     ICICI     |
            |     Kotak     |


    Scenario Outline: Shravan can delete the bank account
        When I click on delete button for <bank_name> account 
        Then <bank_name> account should be deleted 

        Examples:
            |   bank_name   |
            |     ICICI     |
            |     Kotak     |

      Scenario Outline: Shravan can see his deleted bank accounts  on the list
        When I click on the "Bank Accounts" tab
        Then I should see <bank_name> in the accounts list with a "deleted" tag

         Examples:
            |   bank_name   |
            |     ICICI     |
            |     Kotak     |
