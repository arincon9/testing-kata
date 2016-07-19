class Person
  attr_accessor :first_name, :middle_name, :last_name

  def initialize(first_name:, middle_name: nil, last_name:)
    @first_name  = first_name
    @middle_name = middle_name
    @last_name   = last_name
  end

  def full_name
    if middle_name.nil?
      "#{first_name} #{last_name}"
    else
      "#{first_name} #{middle_name} #{last_name}"
    end
  end

  def full_name_with_middle_initial
    "#{first_name} #{initial(middle_name)}. #{last_name}"
  end

  def initial(string)
    string[0,1]
  end

  def initials
    "#{initial(first_name)}.#{initial(middle_name)}.#{initial(last_name)}."
  end

end

RSpec.describe Person do
  describe "#full_name" do
    it "concatenates first name, middle name, and last name with spaces" do
      person = Person.new(first_name: "Benjamin", middle_name: "Frederick", last_name: "Button")

      expect(person.full_name).to eq("Benjamin Frederick Button")
    end

    it "does not add extra spaces if middle name is missing" do
      person = Person.new(first_name: "Benjamin", last_name: "Button")

      expect(person.full_name).to eq("Benjamin Button")
    end
  end

  describe "#full_name_with_middle_initial" do
    it "returns the full name with the middle initial for the middle name" do
      person = Person.new(first_name: "Benjamin", middle_name: "Frederick", last_name: "Button")

      expect(person.full_name_with_middle_initial).to eq("Benjamin F. Button")
    end
  end

  describe "#initials" do
    it "returns the initials given a first name, middle name and last name" do
      person = Person.new(first_name: "Benjamin", middle_name: "Frederick", last_name: "Button")

      expect(person.initials).to eq("B.F.B.")
    end
  end
end

