require 'yaml/store'

class Idea
  include Comparable
  attr_reader :title, :description, :rank, :id
  attr_accessor :resources

  def initialize(attributes = {})
    @title = attributes["title"]
    @description = attributes["description"]
    @rank = attributes["rank"] || 0
    @id = attributes["id"]
    @resources = generate_link(attributes["resources"])
  end

  def save
    IdeaStore.create(to_h)
  end

  def generate_link(resources)
    if resources.nil?
      resources
    elsif resources.match(/^http:\/\/www.\w+.\w{2,3}$/)
      self.resources = "<a href='#{resources}'>#{resources}</a>"
    else
      resources
    end
  end

  def to_h
    {
      "title"       => title,
      "description" => description,
      "rank"        => rank,
      "resources"   => resources
    }
  end

  def like!
    @rank += 1
  end

  def <=>(other)
    other.rank <=> rank
  end
end
