require 'rails/generators/base'

module FluxFlex
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc <<DESC
Description:
    Add files to deploy for fluxflex
DESC
      def self.source_root
        @_flx_tools_source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'templates'))
      end

      def copy_dot_flx
        template '.flx'
      end
    end
  end
end
