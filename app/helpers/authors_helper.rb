module AuthorsHelper

  # Returns the Gravatar (http://gravatar.com/) for the given author.
  def gravatar_for(author)
    gravatar_id = Digest::MD5::hexdigest(author.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: author.name, class: "gravatar")
  end
end
