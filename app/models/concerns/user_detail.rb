module UserDetail
  extend ActiveSupport::Concern
  module ClassMethods    
      def from_omniauth(auth)
        if auth.info.email.include? "joshsoftware.com"
          user = User.where(email: auth.info.email).first
          create_public_profile_if_not_present(user, auth)
          user
        else
          false
        end
      end

      def create_public_profile_if_not_present(user, auth)
        if user && !user.public_profile?
          user.build_public_profile(first_name: auth.info.first_name, last_name: auth.info.last_name).save
          user.update_attributes(provider: auth.provider, uid: auth.uid)
        end
      end
  end
end