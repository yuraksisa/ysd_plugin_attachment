module Sinatra
  module YSD
    module StorageManagement
       
      def self.registered(app)
                    
        #
        # Storage management page
        #        
        app.get "/admin/site/files/storages/?*" do
          load_em_page :storage_management, :storages, false
        end
        
      
      end
    
    end #MenuManagement
  end #YSD
end #Sinatra