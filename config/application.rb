require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailstutorialApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # add_routing_pathsはconfig/routes.rbファイルを読み込みルーティングをセットアップする
    initializer(:remove_action_mailbox_and_activestorage_and_turbo_routes, after: :add_routing_paths) { |app|
      app.routes_reloader.paths.delete_if {|path| path =~ /activestorage/ }
      app.routes_reloader.paths.delete_if {|path| path =~ /actionmailbox/ }
      app.routes_reloader.paths.delete_if {|path| path =~ /turbo/ }
    }

    # app.routes_relaoder
    # @paths=
    # ["/home/vagrant/workspace/railstutorial_app/config/routes.rb",
    # "/home/vagrant/.rbenv/versions/2.7.5/lib/ruby/gems/2.7.0/gems/turbo-rails-1.0.1/config/routes.rb",
    # "/home/vagrant/.rbenv/versions/2.7.5/lib/ruby/gems/2.7.0/gems/actionmailbox-7.0.2/config/routes.rb",
    # "/home/vagrant/.rbenv/versions/2.7.5/lib/ruby/gems/2.7.0/gems/activestorage-7.0.2/config/routes.rb"],


    # def routes_reloader
    #   @routes_reloader ||= RoutesReloader.new
    # end

    # RoutesReloader.new
    # def initialize
    #   @paths = []
    #   @routes_sets = []
    #   @eager_load = []
    # end
  end
end