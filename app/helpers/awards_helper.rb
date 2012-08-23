module AwardsHelper

	def pie_chart(data, title)
		charts = {}
		for key, data in data
			charts["#{key}"] = LazyHighCharts::HighChart.new("#{key}") do |f|
	          f.options[:title] = title
	          f.options[:chart][:renderTo] = "#{key}"
	          f.options[:chart][:defaultSeriesType] = "pie"
	          f.series(:data=>data.collect{|k, v| [k, v["count"]]})
	    	end
	    end	
	    return charts
	end
	
end
