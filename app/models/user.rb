class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  has_many :books, dependent: :destroy

  validates :name, uniqueness: true, presence: true,
            length: { minimum: 2, maximum: 20 }


  validates :introduction, length: { maximum: 50 }

  #presence: true

  def get_profile_image(x,y)#indexの中のget_imageの呼び出しってだけ　ここは名前なんでもいい
    unless profile_image.attached?#保存されているか？
      file_path = Rails.root.join('app/assets/images/no_image.jpg')#file_pathは今定義した。Rails.rootはこのディレクトリのこと joinは参加させる
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')#imageに保存
    end
    profile_image.variant(resize_to_limit: [x,y]).processed
  end

end
