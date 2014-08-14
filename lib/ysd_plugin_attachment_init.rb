require 'ysd-plugins' unless defined?Plugins::Plugin
require 'ysd_plugin_attachment_extension'

Plugins::SinatraAppPlugin.register :attachment do

   name=        'attachment'
   author=      'yurak sisa'
   description= 'Add attachments'
   version=     '0.1'
   hooker       Huasi::AttachmentExtension
   sinatra_extension Sinatra::YSD::Attachment
   sinatra_extension Sinatra::YSD::FilesDashboard   
   sinatra_extension Sinatra::YSD::StorageManagement
   sinatra_extension Sinatra::YSD::StorageManagementRESTApi
end

