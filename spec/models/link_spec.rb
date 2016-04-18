require 'rails_helper'

RSpec.describe Link, type: :model do
  describe "link" do
    it "can create an link with valid attributes" do
      link = Link.create(title: "This is the title if the link")

      expect(link.title).to eq("This is the title if the link")
      expect(link.read).to eq(false)
    end

    it "default read status of the link is false" do
      link = Link.create(title: "A new Link", read: false)

      expect(link.read).to eq(false)
    end

  end

  describe "updates attributes" do
    it "updates the title" do
      link = Link.create(title: "title")
      link.update(title: "a new title")

      expect(link.title).to eq("a new title")
    end

    it "updates the title" do
      link = Link.create(title: "title", read: false)
      link.update(read: true)

      expect(link.read).to eq(true)
    end

    it "updates the read" do
      link = Link.create(title: "title")
      link.update(read: false)

      expect(link.read).to eq(false)
    end
  end
end
