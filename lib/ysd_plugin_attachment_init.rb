require 'ysd-plugins' unless defined?Plugins::Plugin
require 'ysd_plugin_attachment_extension'

Plugins::SinatraAppPlugin.register :attachment do

   name=        'attachment'
   author=      'yurak sisa'
   description= 'Add attachments'
   version=     '0.1'
   hooker       Huasi::AttachmentExtension
   sinatra_extension Sinatra::Attachment
end

