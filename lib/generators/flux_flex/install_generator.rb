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

      def copy_sh_files
        template 'fluxflex_deploy.sh'
        template 'fluxflex_rake.sh'
        template 'fluxflex_setup.sh'
      end

      def copy_dispatch_fcgi
        template 'flx_dispatch.fcgi', File.join('public', 'flx_dispatch.fcgi')
      end

      def copy_dot_htaccess
        template '.htaccess', File.join('public', '.htaccess')
      end

      def insert_gems
        gemfile = 'Gemfile'
        if File.exists?(gemfile)
          body = File.read(gemfile)
          File.open(gemfile, 'a') do |f|
            f.puts "gem 'mysql2'" unless body.match(/mysql/)
            f.puts "gem 'fcgi'" unless body.match(/fcgi/)
          end
        else
          raise Rails::Generators::Error, "First, you must setup rspec by 'rails generate rspec:install'"
        end

      end
    end
  end
end
