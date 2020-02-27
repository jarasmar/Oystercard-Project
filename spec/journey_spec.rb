require 'journey'

describe Journey do

  it "initializes with #in_journey? false" do
    expect(subject.in_journey?).to eq false
  end

end
