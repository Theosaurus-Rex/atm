#Welcome Message
def welcome_and_input
    system("clear")
    puts "Welcome to your friendly neighborhood ATM!"
    puts "Please select from the following options:"
    puts "   1. Display Balance"
    puts "   2. Make a withdrawal"
    puts "   3. Make a deposit"
    puts "   4. Exit"
    input = gets.chomp.to_i
    case input
        when 1
    #Show Balance
        when 2
    #Make a Withdrawal
        when 3
    #Make a Deposit
        when 4
            puts "See you next time!"
        else
            puts "Invalid Input: Please enter a number from 1 - 4"
            puts "Press any key to continue"
            gets welcome_and_input()
    end
end

welcome_and_input()