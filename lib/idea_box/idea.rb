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

  def save
    IdeaStore.create(to_h)
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
