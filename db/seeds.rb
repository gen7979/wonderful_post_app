# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 3.times do |n|
#   user = User.create!(
#     email: "user#{format("%03d", n + 1)}@test.com",
#     password: "test1234"
#   )
#   50.times do |s|
#     user.articles.create!(
#       title: "No.#{s + 1}:user#{format("%03d", n + 1)}の記事",
#       content: "No.#{s + 1}:user#{format("%03d", n + 1)}の本文"
#     )
#   end
# end

tags = ["学習", "転職活動", "その他"]
tag_records = tags.map do |tag|
  Tag.find_or_create_by!(name: tag)
end

3.times do |n|
  email = "user#{format("%03d", n + 1)}@test.com"
  user = User.find_or_create_by!(email: email) do |user|
    user.password = "test1234"
  end
  50.times do |s|
    title = "No.#{s + 1}:user#{format("%03d", n + 1)}の記事"
    content = "No.#{s + 1}:user#{format("%03d", n + 1)}の本文"
    user.articles.find_or_create_by!(title: title, content: content) do |article|
      article.tags = tag_records
    end
  end
end
