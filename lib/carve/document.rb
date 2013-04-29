module Carve
  class Document
    # 
    # Api calls
    # 
    def self.create(attrs={})
      response = Carve.request.post "documents.json", attrs
      RecursiveOpenStruct.new(response.body, :recurse_over_arrays => true)
    end

    def self.retrieve(id=nil)
      response = Carve.request.get "documents/#{id}.json"
      RecursiveOpenStruct.new(response.body, :recurse_over_arrays => true)
    end

    def self.pages(id=nil)
      response = Carve.request.get "documents/#{id}/pages.json"
      RecursiveOpenStruct.new(response.body, :recurse_over_arrays => true)
    end
  end
end
