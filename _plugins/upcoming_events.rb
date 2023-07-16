module Reading
  class Generator < Jekyll::Generator
    VERSION = '0.1.0'

    def generate(site)
      # Init new data categories
      site.data['upcomingEvents'] ||= []
      site.data['pastEvents'] ||= []

      # Loop through events
      site.collections['events'].docs.each do |event|
          if event.start >= Time.now
            site.data['upcomingEvents'] << event
          else
            site.data['pastEvents'] << event
          end
      end
    end

  end
end
