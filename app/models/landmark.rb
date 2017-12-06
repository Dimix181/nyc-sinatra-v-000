class Landmark <ActiveRecord::Base
  belongs_to :figure

  require_relative "./concerns/slugifiable.rb"

  include Slugifiable

  def self.find_by_slug(slug)
    Figure.all.detect{|obj|obj.slug == slug}
  end

  def self.lookup(params)
    if params.to_i > 0
      self.find(params.to_i)
    else
      self.find_by_slug(params)
    end
  end

end
