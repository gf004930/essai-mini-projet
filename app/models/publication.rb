# == Schema Information
#
# Table name: publications
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  type       :string(255)
#  name       :string(255)
#  year       :integer
#  month      :integer
#  pages      :integer
#  grade      :integer
#  author_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Publication < ActiveRecord::Base
  belongs_to :author
  attr_accessible :grade, :month, :name, :pages, :title, :type, :year
end
