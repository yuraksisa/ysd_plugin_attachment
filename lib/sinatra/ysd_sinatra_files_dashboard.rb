module Sinatra
  module YSD
    module FilesDashboard
      def self.registered(app)

        #
        # Site files console
        #
        app.get '/admin/files', :allowed_usergroups => ['staff'] do
          load_page :attachment_dashboard
        end	

        #
        # Media Gallery configuration
        #
        app.get '/admin/files/config', :allowed_usergroups => ['staff'] do
          locals = {}
          files_storage = SystemConfiguration::Variable.get_value('attachment.default_storage', nil)
          locals.store(:not_files_storage, (files_storage.nil? or files_storage.empty?) )
          locals.store(:storages, Hash[ *::Model::Storage.all.collect { |v| [v.id, v.id]}.flatten ])
          load_page(:config_files, :locals => locals)
        end

      end
    end
  end
end    	
    