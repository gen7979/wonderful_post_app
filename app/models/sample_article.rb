class SampleArticle < ApplicationRecord
  validates :account, presence: true
  validates :account, uniqueness: {case_sensitive: false}
end
