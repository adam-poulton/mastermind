module Mastermind
  describe Board do

    TestPin = Struct.new(:value)
    let(:r_pin) { TestPin.new("R") }
    let(:b_pin) { TestPin.new("B") }
    let(:g_pin) { TestPin.new("G") }
    let(:y_pin) { TestPin.new("Y") }
    
    context "#initialize" do
      it "initializes with empty grid by default" do
        board = Board.new(answer: "RRRR")
        expect(board.grid).to eq([])
      end
      it "initializes to a current_round of 0" do
        board = Board.new(answer: "RRRR")
        expect(board.current_round).to eq(0)
      end
      it "initializes to expected max_round" do
        board = Board.new(answer: "RRRR", rounds: 10)
        expect(board.max_round).to eq(10)
      end
      it "initializes with empty results" do
        board = Board.new(answer: "RRRR")
        expect(board.results).to eq([])
      end
    end

    context "#add_guess" do
      it "adds a guess to grid" do
        board = Board.new(answer: "RRRR")
        board.add_guess("GGGG")
        expect(board.grid.size).to eq(1)
      end
      it "adds a guess correctly" do
        board = Board.new(answer: "RRRR")
        board.add_guess("GBRY")
        value = board.grid[0].map(&:value).join
        expect(value).to eq("GBRY")
      end
      it "adds multiple guesses" do
        board = Board.new(answer: "RRRR")
        board.add_guess("GBRY")
        board.add_guess("BBBB")
        board.add_guess("GBGB")
        expect(board.grid.size).to eq(3)
      end
      it "adds multiple guesses correctly" do
        board = Board.new(answer: "RRRR")
        board.add_guess("GBRY")
        board.add_guess("BBBB")
        board.add_guess("GBGB")
        value = board.grid.pop.map(&:value).join
        expect(value).to eq("GBGB")
      end
    end

    context "#set_answer" do
      it "initialises the answer correctly" do
        board = Board.new(answer: "RGBY")
        expect(board.answer.map(&:value).join).to eq "RGBY"
      end
      it "changes the answer correctly" do
        board = Board.new(answer: "RGBY")
        board.set_answer("BGBG")
        expect(board.answer.map(&:value).join).to eq "BGBG"
      end
    end

  end
end