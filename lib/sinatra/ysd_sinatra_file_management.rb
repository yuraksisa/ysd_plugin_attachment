module Sinatra
  module YSD
    module FileManagement

      def self.registered(app)

        #
        # Album management page
        #
        app.get "/admin/files/fileset/?*" do

          load_em_page :fileset, :file_set, false

        end

      end

    end
  end
end