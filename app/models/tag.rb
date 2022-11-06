class Tag < ApplicationRecord
  has_many :book_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :books, through: :book_tags


  scope :merge_books, -> (tags){ }

  # def self.search_books_for(content, method)

  #   if method == 'perfect'
  #     tags = Tag.where(name: content)
  #   elsif method == 'forward'
  #     tags = Tag.where('name LIKE ?', content + '%')
  #   elsif method == 'backward'
  #     tags = Tag.where('name LIKE ?', '%' + content)
  #   else
  #     tags = Tag.where('name LIKE ?', '%' + content + '%')
  #   end

  #   return tags.inject(init = []) {|result, tag| result + tag.books}

  # end

  def self.search_books_for(search, word)

    if search == "perfect_match"
      tags = Tag.where("name LIKE?", "#{word}")

    elsif search == "forward_match"
      tags = Tag.where("name LIKE?", "#{word}%")

    elsif search == "backward_match"
      tags = Tag.where("name LIKE?", "%#{word}")

    elsif search == "partial_match"
      tags = Tag.where("name LIKE?", "%#{word}%")
    else
      tags = Tag.all

    end

    return tags.inject(init = []) {|result, tag| result + tag.books}

  end


end


# 配列オブジェクト.inject {|初期値, 要素| ブロック処理 }
# 繰り返し順にブロックの要素が配列分加算されていき、
# ブロックの処理にて計算を行っていきます。

# (init = [])   初期化