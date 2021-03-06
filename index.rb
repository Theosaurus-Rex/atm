#Welcome Message
require './validators'
require './atm_view'

# Balance Storage File
balance = File.read('balance.txt')

#Clear Screen
system("clear")



$atm_view = AtmView.new

#Message on startup
def welcome_and_input()
    puts "\nWelcome to your friendly neighborhood ATM!"
    $atm_view.show_options
    input = gets.chomp
    input_valid = Validators.validate_input(input)
    if !input_valid
        puts "Error: Invalid Input"
        puts "Press any key to continue"
        gets
        welcome_and_input()
    end
    #Selection criteria
    case input.to_i
        when 1
            show_balance()
        when 2
            withdraw_money()
        when 3
            deposit_money()
        when 4
            puts "See you next time!"
            exit(0)
    end
end

def show_balance
    balance = File.read('balance.txt')
    puts "Your current balance is $#{balance}"
    puts "Press any key to continue"
    gets
    welcome_and_input()
end 

def withdraw_money
    balance = File.read('balance.txt').to_i
    puts "How much would you like to withdraw?"
    amount = gets.to_i
    valid = Validators.validate_withdrawal(amount)
        if !valid
            puts "Error! Invalid value, please enter a positive number."
            withdraw_money
        end
        if amount == 0
            puts "Error! Invalid value entered"
            withdraw_money
        elsif amount > balance
            puts "Error! You do not have the required funds"
            withdraw_money
        else 
            balance -= amount
            File.write('balance.txt', "#{balance}")
            puts "Your new balance is $#{balance}"
            puts "Press any key to continue"
            gets
            welcome_and_input()
        end
end

def deposit_money
    balance = File.read('balance.txt').to_i
    puts "How much would you like to deposit?"
    amount = gets.to_i
    input_valid = Validators.validate_input(amount)
        if !input_valid
            puts 'Error! Value must be a positive number'
            deposit_money
        end
        if amount == 0
            puts "Error! Invalid value entered"
            deposit_money
        else 
            balance += amount
            File.write('balance.txt', "#{balance}")
            puts "Your new balance is $#{balance}"
            puts "Press any key to continue"
            gets
            welcome_and_input()
        end
end
welcome_and_input()