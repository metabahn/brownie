module Brownie
  class Common
    def self.domain
      if ENV["RACK_ENV"] == 'production'
        return "onlinetools.ups.com"
      else
        return "wwwcie.ups.com"
      end
    end

    def self.template_to_hash(template,root="ShipmentConfirmRequest")
      xml_path = File.join(File.dirname(File.expand_path(__FILE__)), "../../xml/#{template}.xml")
      digest_xml_file = File.open(xml_path, "rb")
      xml = digest_xml_file.read
      hash = Hash.from_xml(xml)
      hash[root]
    end
  end
end
