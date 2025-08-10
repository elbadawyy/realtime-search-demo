class SearchesController < ApplicationController
    def create
        query = params[:query].to_s.strip
        ip = request.remote_ip

        consolidator = QueryConsolidator.new(
            ip: ip,
            new_query: query
        )

        consolidator.save_or_update(ip: ip)

        head :ok
    end
end
