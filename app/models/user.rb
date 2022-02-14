class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  has_many :books, dependent: :destroy

  #def get_image#indexの中のget_imageの呼び出しってだけ
  # unless image.attached?#保存されているか？
  #     file_path = Rails.root.join('app/assets/images/no_image.jpg')#file_pathは今定義した。Rails.rootはこのディレクトリのこと joinは参加させる
  #     image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')#imageに保存
  #   end
    #profile_image.variant(resize_to_limit: [100, 100]).processed
  
  
end
