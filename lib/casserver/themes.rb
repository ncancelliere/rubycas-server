require 'uri'

# Encapsulates CAS theme functionality. This module is meant to be included in
# the CASServer module.
module CASServer
  module Themes
    def self.included(base)
      base.extend ClassMethods
      base.send(:include, InstanceMethods)
    end

    module ClassMethods
      def init_themes!
        if settings.config[:theme].is_a?(HashWithIndifferentAccess)
          settings.config[:theme].each_pair{ |k,v| v.each{ |value| theme_map.merge!({ value => k }) } }
        end
      end

      def theme_map
        @theme_map ||= {}
      end

    end

    module InstanceMethods
      # looking at the requests service uri match to a theme from the @@theme_map or use 'simple' as default
      # if the theme is not a hash then just return the string (in the case of a single theme set-up)
      def resolve_theme(uri)
        theme_config = settings.config[:theme]
        theme_key = URI.parse(uri).host

        if theme_config.is_a?(HashWithIndifferentAccess) && theme_key
          self.class.theme_map.fetch(theme_key, 'simple')
        elsif theme_config.is_a?(String)
          theme_config
        else
          'simple'
        end
      rescue URI::InvalidURIError
        $LOG.error("Couldn't parse the URI '#{uri}' to resolve the theme!")
        return 'simple'
      rescue Exception => e
        $LOG.error("Couldn't resolve the theme, make sure you are providing a string or hash in the config!")
        $LOG.error(e.message)
        return 'simple'
      end
    end
  end
end