require 'open-uri'
require 'nokogiri'

module RightThing

  class Job

    def self.all(url)
      doc = Nokogiri::XML(open(url))

      doc.search("//job").map { |element|
        {
          :title            => extract_text(element, "title"),
          :date             => extract_time(element, "date"),
          :reference_number => extract_text(element, "referencenumber"),
          :url              => extract_text(element, "url"),
          :company          => extract_text(element, "company"),
          :city             => extract_text(element, "city"),
          :state            => extract_text(element, "state"),
          :country          => extract_text(element, "country"),
          :postal_code      => extract_text(element, "postalcode"),
          :description      => extract_text(element, "description"),
        }
      }
    end

    def self.extract_text(element, name)
      if node = element.at(name)
        node.text
      end
    end

    def self.extract_time(element, name)
      if text = extract_text(element, name)
        Time.parse text
      end
    end

  end

end
