1. What this app does

   - The app will allow the user to create new clients
   - The app will allow the user to deposit and withdraw money from a client's account
   - The app will allow the user to view a statement with all transactions and dates

2. User story:

   Given a client makes a deposit of 1000 on 10-01-2023
   And a deposit of 2000 on 13-01-2023
   And a withdrawal of 500 on 14-01-2023
   When she prints her bank statement
   Then she would see:

   date || credit || debit || balance
   14/01/2023 || || 500.00 || 2500.00
   13/01/2023 || 2000.00 || || 3000.00
   10/01/2023 || 1000.00 || || 1000.00

3. How to run the app
   a. Clone the repository

   git clone https://github.com/Paul3111/bank_tech

   b. If Ruby is not already installed:

   rvm get stable
   rvm use ruby --latest --install --default

   c. Install bundler

   gem install bundler
   bundle init
   bundle install
   rspec --init

   d. Run Rspec with the following command
   rspec

   e. Check the tests coverage by using the following command

   open coverage/index.html

![Coverage at 18/04/2023](../coverage/coverage_example.png)

4. Dependencies
   - rvm
   - bundler
