# this is needed for now to make mass assignment security compatible with the translation of globalize3
Globalize::ActiveRecord::Translation.class_eval do
  attr_accessible :locale
end

class Menu < ActiveRecord::Base
  
  attr_accessible :name, :path, :position, :parent_id
  
  validates_presence_of :name, :path
  
  translates :name, :path
    
  def to_param
    name ? "#{id}-#{name.to_url}" : id
  end
  
  scope :ordered, order('position, id')
  # tree scopes
  scope :orphans, where('parent_id IS ?', nil)
  scope :with_parent_id, lambda { |id| where('parent_id = ?', id) }
  
  def orphan?
    parent_id == nil
  end
  
  def has_children?
    Menu.with_parent_id(id).count >= 1
  end
  
  def children
    Menu.with_parent_id(id)
  end
  
  def parent
    Menu.find(parent_id)
  end
  
  def has_siblings?
    Menu.with_parent_id(parent_id).count >= 1
  end
  
  def siblings
    Menu.with_parent_id(parent_id)
  end
  
end
