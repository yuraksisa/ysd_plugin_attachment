require 'ysd_md_content'
require 'ysd_md_attachment'

#
# It represents the photo information attached to a content
#
module ContentManagerSystem
  
  # Opens the class Content to include the attachments
  class Content
    include ::Model::AttachmentPersistence
  end
  
end #ContentManagerSystem

