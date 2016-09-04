require 'nokogiri'
require 'open-uri'

class LeakChecker
  attr_reader :project, :dom
  attr_accessor :leaked

  def initialize(project)
    @project = project
    @dom = dom_element_from_webpage
    @leaked = false
  end

  def call
    if is_a_leak?(leaked_text_on_webpage)
      update_leak_status
      project.notify_subscribers_of_leak
    end
  end

  private

  def update_leak_status
    project.update_attributes(leaked: true)
  end

  def dom_element_from_webpage
    Nokogiri::HTML(open(
      project.link,
      'User-Agent' => 'firefox')
    )
  end

  def leaked_text_on_webpage
    dom.at_css('.fontello-icon-droplet')
  end

  def is_a_leak?(dom_element)
    dom_element.children.first.inner_text.include?('Leaked')
  end
end
