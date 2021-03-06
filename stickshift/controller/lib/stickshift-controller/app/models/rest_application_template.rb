class RestApplicationTemplate < StickShift::Model
  attr_accessor :uuid, :display_name, :descriptor_yaml, :git_url, :tags, :gear_cost, :metadata, :links
  
  def initialize(template, url)
    @uuid, @display_name, @descriptor_yaml, @git_url, @tags, @gear_cost, @metadata =
     template.uuid, template.display_name, template.descriptor_yaml, template.git_url, template.tags,
        template.gear_cost, template.metadata
        
    self.links = {
      "GET_TEMPLATE" => Link.new("Get specific template", "GET", URI::join(url, "application_template/#{@uuid}")),
      "LIST_TEMPLATES" => Link.new("Get specific template", "GET", URI::join(url, "application_template")),
      "LIST_TEMPLATES_BY_TAG" => Link.new("Get specific template", "GET", URI::join(url, "application_template/TAG"))
    }
  end
  
  def to_xml(options={})
    options[:tag_name] = "template"
    super(options)
  end
end
