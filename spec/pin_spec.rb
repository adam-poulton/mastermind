module Mastermind
  describe Pin do
 
    context "#initialize" do
      it "is initialized with a value of '' by default" do
        pin = Pin.new
        expect(pin.value).to eq ''
      end

      it "can be initialized with a value of 'R'" do
        pin = Pin.new("R")
        expect(pin.value).to eq "R"
      end
    end
 
  end
end