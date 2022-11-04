class Group < ApplicationRecord

  belongs_to :owner, class_name: 'User'
  has_many :group_users, dependent: :destroy
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

end