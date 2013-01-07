# == Schema Information
#
# Table name: authors
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  firstname       :string(255)
#  email           :string(255)
#  lab             :integer
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'spec_helper'

describe Author do

  before do
    @author = Author.new(name: "Example name", firstname: "Example firstname", email: "author@example.com", lab: 1,
                     password: "foobar", password_confirmation: "foobar")
  end

  subject { @author }

  it { should respond_to(:name) }
  it { should respond_to(:firstname) }
  it { should respond_to(:email) }
  it { should respond_to(:lab) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should be_valid }

  describe "when name is not present" do
    before { @author.name = " " }
    it { should_not be_valid }
  end

    describe "when firstname is not present" do
    before { @author.firstname = " " }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @author.email = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @author.name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when firstname is too long" do
    before { @author.firstname = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when name and firstname are already taken" do
    before do
      user_with_same_name_and_firstname = @author.dup
      user_with_same_name_and_firstname.email = "another@example.com"
      user_with_same_name_and_firstname.save
    end

    it { should_not be_valid }
  end

  describe "when only name is already taken" do
    before do
      user_with_same_name = @author.dup
      user_with_same_name.email = "another@example.com"
      user_with_same_name.firstname = "another"
      user_with_same_name.save
    end

    it { should be_valid }
  end

  describe "when only firstname is already taken" do
    before do
      user_with_same_firstname = @author.dup
      user_with_same_firstname.email = "another@example.com"
      user_with_same_firstname.name = "another"
      user_with_same_firstname.save
    end

    it { should be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @author.email = invalid_address
        @author.should_not be_valid
      end      
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @author.email = valid_address
        @author.should be_valid
      end      
    end
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @author.dup
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when password is not present" do
    before { @author.password = @author.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @author.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before { @author.password_confirmation = nil }
    it { should_not be_valid }
  end
end
