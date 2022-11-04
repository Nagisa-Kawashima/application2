class Group < ApplicationRecord

  belongs_to :owner, class_name: 'User'
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users, source: :user
  # has_many :users, through: :group_users
  has_one_attached :image



  validates :name, presence: true
  validates :introduction, presence: true
  # attachment :image, destroy: false

  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end

  def is_owned_by?(user)
    owner.id == user.id
  end

  def includesUser?(user)
    group_users.exists?(user_id: user.id)
  end

end


# 自由に関連付け名を指定した場合、どこのテーブルからデータを取得すれば良いかを判断してくれないので、
# sourceオプションで指定してあげることで解決できます。

# has_manyメソッドのsourceオプションは次の場合に使用します。

# 多対多のアソシエーションに別名をつける
# has_manyで指定するモデル名が重複している
# 命名を変更する場合はsourceオプションを指定する必要があります。
# sourceオプションは多対多のアソシエーションの場合ですが、一対多のアソシエーションの場合はclass_nameオプションで解決できます。


# has_many_attachedマクロは、レコードとファイルの間に1対多の関係を設定します。各レコードには、多数の添付ファイルをアタッチできます。
# あるメッセージに何らかの画像がアタッチされているかどうかを調べるには、images.attached?を呼び出します。