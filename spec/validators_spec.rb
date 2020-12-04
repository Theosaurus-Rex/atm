require '../validators'

describe 'validate input' do
    it 'checks if input is valid' do
        expect(Validators.validate_input("1")).to eq(true)
        expect(Validators.validate_input("2")).to eq(true)
        expect(Validators.validate_input("3")).to eq(true)
        expect(Validators.validate_input("4")).to eq(true)
        expect(Validators.validate_input("1.2347623")).to eq(true)
        expect(Validators.validate_input("1dwdw")).to eq(true)
        expect(Validators.validate_input("0")).to eq(false)
        expect(Validators.validate_input("5")).to eq(false)
        expect(Validators.validate_input("dog")).to eq(false)
    end
end