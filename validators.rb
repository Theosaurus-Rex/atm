module Validators
    #Options menu input validation
    def self.validate_input(input)
        num_input = input.to_i
        if num_input > 0 && num_input < 5
            return true
        else 
            return false
        end
    end

    #Validate amount to be withdrawn
    #Must be positive integer and <= current balance
    def self.validate_withdrawal(input)
        balance = File.read('balance.txt').to_i
        num_input = input.to_i
        if num_input > 0 && num_input <= balance
            return true
        else
            return false
        end
    end
end