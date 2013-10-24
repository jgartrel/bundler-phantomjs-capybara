class Hello
  attr_reader :value

  def initialize
    @value = "Hello World"
  end
end

describe "Ruby" do
  it "returns correct version" do
    RUBY_VERSION.should eq("1.9.3")
    RUBY_PATCHLEVEL.should eq(448)
  end
end
