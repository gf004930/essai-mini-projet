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

require 'spec_helper'

describe Publication do
  pending "add some examples to (or delete) #{__FILE__}"
end
