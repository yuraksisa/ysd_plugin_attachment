require 'ysd_md_attachment' unless defined?Model::FilesetAttachment
module Sinatra
  module YSD
    module FileManagementRESTApi

      def self.registered(app)

        #
        # Retrieve albums (POST)
        #
        ["/api/filesets","/api/filesets/page/:page"].each do |path|
          app.post path do
          
            data=Model::FileSetAttachment.all
                        
            begin # Count does not work for all adapters
              total=Model::FileSetAttachment.count
            rescue
              total=Model::FileSetAttachment.all.length
            end
            
            content_type :json
            {:data => data, :summary => {:total => total}}.to_json
          
          end
        
        end

        #
        # Get an album
        #
        app.get "/api/fileset/:id" do
        
          album = Model::FileSetAttachment.get(params[:if])
          
          status 200
          content_type :json
          album.to_json
        
        end

        #
        # Create a new album
        #
        app.post "/api/fileset" do
          
          request.body.rewind
          fileset_request = JSON.parse(URI.unescape(request.body.read))

          the_album = Model::FileSetAttachment.create(fileset_request) 
          
          status 200
          content_type :json
          the_album.to_json          
        
        end
        
        #
        # Updates a album
        #
        app.put "/api/fileset" do
        
          request.body.rewind
          fileset_request = JSON.parse(URI.unescape(request.body.read))
                
          the_fileset = Model::FileSetAttachment.get(fileset_request['id'])
          the_fileset.attributes=(fileset_request)
          the_fileset.save
                   
          status 200
          content_type :json
          the_fileset.to_json
        
        
        end
        
        #
        # Deletes an album
        #
        app.delete "/api/fileset" do

          request.body.rewind
          fileset_request = JSON.parse(URI.unescape(request.body.read))
          
          if the_fileset = Model::FileSetAttachment.get(fileset_request['id'])
            the_fileset.destroy
          end
          
          status 200
          content_type :json
          true.to_json 
        
        end

      end

    end
  end
end