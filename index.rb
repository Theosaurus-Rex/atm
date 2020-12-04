#Welcome Message
require './validators'

balance = File.read('balance.txt')

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
            withdraw_money()
        when 3
            deposit_money()
        when 4
            puts "See you next time!"
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