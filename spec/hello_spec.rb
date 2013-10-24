class Hello
  attr_reader :value

  def initialize
    @value = "Hello World"
  end
end

describe Hello do
  it "returns a true value", :checkin => true do
    c = Hello.new
    c.value.should eq("Hello World")
  end
end
