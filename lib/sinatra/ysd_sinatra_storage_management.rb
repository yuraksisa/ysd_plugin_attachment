module Sinatra
  module YSD
    module StorageManagement
       
      def self.registered(app)
                    
        #
        # Storage management page
        #        
        app.get "/storage-management/?*" do
          load_page 'storage_management'.to_sym
        end
        
      
      end
    
    end #MenuManagement
  end #YSD
end #Sinatra