module Mastermind
  describe Result do

    TestPin = Struct.new(:value)
    let(:r_pin) { TestPin.new("R") }
    let(:b_pin) { TestPin.new("B") }
    let(:g_pin) { TestPin.new("G") }
    let(:y_pin) { TestPin.new("Y") }
    
    context "#initialize" do
      it "gives correct feedback when guess = 'RRRR' and answer = 'RRRR'" do
        guess = [r_pin, r_pin, r_pin, r_pin]
        answer = [r_pin, r_pin, r_pin, r_pin]
        result = Result.new(guess, answer)
        expect(result.value).to eq (Result::CORRECT_POSITION * 4)
      end

      it "gives correct feedback when guess = 'RRBB' and answer = 'BBRR'" do
        guess = [r_pin, r_pin, b_pin, b_pin]
        answer = [b_pin, b_pin, r_pin, r_pin]
        result = Result.new(guess, answer)
        expect(result.value).to eq (Result::CORRECT_COLOR * 4)
      end

      it "gives correct feedback when guess = 'BBBB' and answer = 'RRRR'" do
        guess = [b_pin, b_pin, b_pin, b_pin]
        answer = [r_pin, r_pin, r_pin, r_pin]
        result = Result.new(guess, answer)
        expect(result.value).to eq ("")
      end

      it "gives correct feedback when guess = 'RGBY' and answer = 'YBGR'" do
        guess = [r_pin, g_pin, b_pin, y_pin]
        answer = [y_pin, b_pin, g_pin, r_pin]
        result = Result.new(guess, answer)
        expect(result.value).to eq (Result::CORRECT_COLOR * 4)
      end

      it "gives correct feedback when guess = 'RRRY' and answer = 'YRRR'" do
        guess = [r_pin, r_pin, r_pin, y_pin]
        answer = [y_pin, r_pin, r_pin, r_pin]
        result = Result.new(guess, answer)
        expect(result.value).to eq (Result::CORRECT_POSITION * 2 + Result::CORRECT_COLOR * 2)
      end

      it "gives correct feedback when guess = 'YGBY' and answer = 'YBGY'" do
        guess = [y_pin, g_pin, b_pin, y_pin]
        answer = [y_pin, b_pin, g_pin, y_pin]
        result = Result.new(guess, answer)
        expect(result.value).to eq (Result::CORRECT_POSITION * 2 + Result::CORRECT_COLOR * 2)
      end

    end
  end
end