module Worldcat
  class Client
    include HTTParty

    base_uri 'http://www.worldcat.org/webservices/catalog'

    def initialize(wskey)
      self.class.default_params :wskey => wskey
    end

    def search(query, options = {})
      options.merge!({:query => query})
      self.class.get("/search/sru", :query => options)
    end

    def get_record(id, options = {})
      id = format_id_param(id)
      self.class.get("/content/#{id}", :query => options)
    end

    def get_locations(id, options = {})
      id = format_id_param(id)
      self.class.get("/content/libraries/#{id}", :query => options)
    end

    def get_catalog_urls(id, oclcsymbol, options = {})
      options.merge!(:oclcsymbol => Array(oclcsymbol).join(','))
      get_locations(id, options)
    end

    def get_citations(id, options = {})
      id = format_id_param(id)
      self.class.get("/content/citations/#{id}", :query => options)
    end

    private

    def format_id_param(id)
      Array(id).join('/')
    end
  end
end
