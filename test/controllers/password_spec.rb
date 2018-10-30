require 'rspec'

describe PasswordController do
  before do
    @pass1 = PasswordController.new
  end
  it "can validate a string length" do
    expect(@pass1.good_length?("Andrew")).to eq(true) #right at 6 valid chars
    expect(@pass1.good_length?("Andrews")).to eq(true) #more than 6 valid chars
    expect(@pass1.good_length?("John")).to eq(false) #too short
    expect(@pass1.good_length?("Andy#")).to eq(false) #too short w/ bad char
    expect(@pass1.good_length?("J!onathan")).to eq(false) #more than 6 chars w/ bad chars
    expect(@pass1.good_length?("")).to eq(false) #empty string
    expect(@pass1.good_length?(" ")).to eq(false) #whitespace only
  end
end
