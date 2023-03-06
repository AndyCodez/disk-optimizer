require_relative '../lib/directory'

describe Directory do
    context 'when creating a new object' do
        it "fails if the :name is absent" do
            invalid_dir = Directory.new(name: nil)
            expect(invalid_dir).not_to be_valid
        end    

        it "succeeds if the :name is present" do 
            valid_dir = Directory.new(name: "Sample directory")
            expect(valid_dir).to be_valid
        end

        
    end
        
end