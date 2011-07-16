require 'rails/generators/base'

module FlxTools
  module Generators
    class FlxToolsGenerator < Rails::Generators::Base
      desc <<DESC
Description:
    Add files to deploy for fluxflex
DESC
      def self.source_root
        @_flx_tools_source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'templates'))
      end

      def hoge
      end
    end
  end
end
