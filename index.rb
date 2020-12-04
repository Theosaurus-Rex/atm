#Welcome Message
require './validators'

def welcome_and_input
    system("clear")
    puts "Welcome to your friendly neighborhood ATM!"
    puts "Please select from the following options:"
    puts "   1. Display Balance"
    puts "   2. Make a withdrawal"
    puts "   3. Make a deposit"
    puts "   4. Exit"
    input = gets.chomp
    input_valid = Validators.validate_input(input)
    if !input_valid
        puts "Error: Invalid Input"
        puts "Press any key to continue"
        gets
        welcome_and_input()
    end
    case input.to_i
        when 1
            show_balance()
        when 2
    #Make a Withdrawal
        when 3
    #Make a Deposit
        when 4
            puts "See you next time!"
    end
end

def show_balance

end 

welcome_and_input()