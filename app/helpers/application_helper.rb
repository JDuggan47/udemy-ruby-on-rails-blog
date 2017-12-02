module ApplicationHelper
  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatr_url = "http://gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatr_url, alt: user.username, class: "image-circle")
  end
end
