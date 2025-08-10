class AnalyticsController < ApplicationController
    def index
        logs = SearchQuery.order(:ip, created_at: :desc)
    
        final_queries = logs.uniq { |log| log.ip }
    
        top_queries = final_queries
          .group_by(&:query)
          .transform_values(&:count)
          .sort_by { |_, count| -count }
          .to_h
    
        if request.format.json?
            render json: top_queries
        else
            render template: "analytics/index"
        end
          
    end
    
end
