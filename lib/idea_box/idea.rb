require 'yaml/store'

class Idea
  include Comparable
  attr_reader :title, :description, :rank, :id, :resources

  def initialize(attributes = {})
    @title = attributes["title"]
    @description = attributes["description"]
    @rank = attributes["rank"] || 0
    @id = attributes["id"]
    @resources = attributes["resources"]
  end

  #generate_link(attributes["resources"])
  def save
    IdeaStore.create(to_h)
  end

  # def generate_link(resources)
  #   if resources.match(/^www.\w+.\w{2,3}$/)
  #     self.resources = "<a href='#{resources}'>Some Name</a>"
  #   else
  #     resources
  #   end
  # end

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
