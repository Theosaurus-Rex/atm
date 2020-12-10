require '../atm_view'
expected_output = "Please select from the following options:\n"\
"   1. Display Balance\n"\
"   2. Make a withdrawal\n"\
"   3. Make a deposit\n"\
"   4. Exit\n"

describe "ATM view" do
    it 'should show the app\'s options' do
        app_view = AtmView.new
        expect { app_view.show_options }.to output(expected_output).to_stdout
    end
end