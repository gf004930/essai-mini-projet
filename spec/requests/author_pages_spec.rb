require 'spec_helper'

describe "Author pages" do

  subject { page }

  describe "profile page" do
    let(:author) { FactoryGirl.create(:author) }
    before { visit author_path(author) }

    it { should have_selector('h1',    text: author.name) }
    it { should have_selector('title', text: author.name) }
  end

  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create an author" do
        expect { click_button submit }.not_to change(Author, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example Name"
        fill_in "Firstname",    with: "Example Firstname"
        fill_in "Email",        with: "user@example.com"
        fill_in "Lab",          with: "1"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create an author" do
        expect { click_button submit }.to change(Author, :count).by(1)
      end
    end
  end
end
