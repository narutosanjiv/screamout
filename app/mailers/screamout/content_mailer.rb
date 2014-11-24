module Screamout
  class ContentMailer < ActionMailer::Base
    default :from => 'intranet@joshsoftware.com'

    def new_content_added(content_id)
      @content = Screamout::Content.where(id: content_id).first
      @title = @content.title.blank? ? @content.url : @content.title
      mail(to: "all@joshsoftware.com", subject: "#{@content.user.public_profile.name.titleize} shared new content on intranet")
    end
  end
end
