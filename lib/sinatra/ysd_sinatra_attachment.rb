require 'tempfile'
require 'mime/types'

#
# Routes
#
module Sinatra
  module YSD
    module Attachment
    
      def self.registered(app)

        # Add the local folders to the views and translations     
        app.settings.views = Array(app.settings.views).push(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'views')))
        app.settings.translations = Array(app.settings.translations).push(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'i18n')))       
                     
        #
        # Creates a new attachment
        #
        app.post "/attachment" do

           io_attachment = params[:file][:tempfile]
           io_attachment.rewind
           size = io_attachment.size
        
           storage_id = if params[:storage] and params[:storage].to_s.strip.length > 0
                          params[:storage]
                        else 
                          ::SystemConfiguration::Variable.get_value('default_storage')
                        end
                         
           remote_file = if params[:folder] and params[:folder].to_s.strip.length > 0
                           File.join(params[:folder], params[:file][:filename]) 
                         else
                           params[:file][:filename]
                         end
           
           puts "file size : #{size} bytes"
           
           storage = ::Model::Storage.get(storage_id)              
           attachment = ::Model::FileAttachment.create_from_io(storage, remote_file, io_attachment, size)
        
           status 200
           attachment.to_json
        
        end
        
        
        #
        # Retrieve an attachment
        #
        app.get "/attachment/:id" do
        
           if file_attachment = ::Model::FileAttachment.get(params[:id])
             
             file_content_type = MIME::Types.type_for(file_attachment.path).last.to_s
             content_type file_content_type
  
             stream(:keep_open => false) do |out|
               file_attachment.download_streaming { |str| out << str }
             end
           
           else  

             status 404
                     
           end 
                   
         end
           
        #
        # Streaming an attachment
        #
        # TODO Tener en cuenta que si es un video, primero solicita los primeros 13 bytes
        #
        app.get "/attachment/:id/streaming" do
        
           if file_attachment = ::Model::FileAttachment.get(params[:id])
             
             file_content_type = MIME::Types.type_for(file_attachment.path).last.to_s
             content_type file_content_type
  
             stream(:keep_open => false) do |out|
               file_attachment.download_streaming { |str| out << str }
             end
                    
           else  

             status 404
                     
           end
        
        
        end           
               
       end
       
     end # Attachment
  end # YSD
end # Sinatra