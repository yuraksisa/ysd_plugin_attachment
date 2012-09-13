module Sinatra
  module YSD
    module StorageManagementRESTApi
       
      def self.registered(app)
               
        #
        # Retrieve all the storages
        #
        app.get "/storages" do
          data = ::Model::Storage.all
          
          content_type :json
          data.to_json
        end
                
        #
        # Retrive storages
        #
        ["/storages","/storages/page/:page"].each do |path|
          app.post path do
            
            data, total = ::Model::Storage.find_all
            
            content_type :json
            {:data => data, :summary => {:total => total}}.to_json
          
          end
        
        end
        
        #
        # Retrieve the storage adapters
        #
        app.get "/storage-adapters" do
        
          adapters = []
          adapters << { :id => 'googledrive', :description => 'googledrive' }
          
          status 200
          content_type :json
          body adapters.to_json
        
        end
        
        #
        # Retrieve an storage
        #
        app.get "/storage/:id" do
          
          storage = Model::Storage.get(params[:id])

          status 200
          content_type :json
          storage.to_json
        
        end
        
        #
        # Create an storage
        #
        app.post "/storage" do
        
          request.body.rewind
          storage_request = JSON.parse(URI.unescape(request.body.read))
          
          # Creates the new menu
          storage = ::Model::Storage.new(storage_request)
          storage.save
          
          # Return          
          status 200
          content_type :json
          storage.to_json          
        
        end
        
        #
        # Updates a menu
        #
        app.put "/storage" do
        
          request.body.rewind
          storage_request = JSON.parse(URI.unescape(request.body.read))
          
          # Updates the storage
          storage = ::Model::Storage.get(storage_request[:id])

          storage.attributes=(storage_request)
          storage.save
          
          # Return          
          status 200
          content_type :json
          storage.to_json
        
        
        end
        
        # Deletes a menu
        app.delete "/storage" do

          request.body.rewind
          storage_request = JSON.parse(URI.unescape(request.body.read))

          # Remove the storage
          storage = ::Model::Storage.get(storage_request[:id])
          storage.destroy
          
          # Return
          status 200
          content_type :json
          true.to_json
          
        end
      
      end
    
    end #MenuManagementRESTApi
  end #YSD
end #Sinatra