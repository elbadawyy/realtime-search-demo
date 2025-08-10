class QueryConsolidator
    def initialize(ip:, new_query:)
      @ip = ip
      @new_query = new_query.strip
    end
  
    def save_or_update(ip:)
      return if @new_query.blank?
  
      last_query = SearchQuery.where(ip: @ip).order(created_at: :desc).first
  
      if last_query && @new_query.starts_with?(last_query.query)
       
        last_query.update(query: @new_query)
      else
        
        SearchQuery.create!(
          query: @new_query,
          ip: ip
        )
      end
    end
end  