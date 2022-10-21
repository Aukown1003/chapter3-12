class List < ApplicationRecord
  #1. $ rails active_storage:install
  #2. $ rails g scaffold user name portrait:attachment(portraitというActive Storage用属性を追加する)
  #3.rails db:migrate
  #4.1対１(単数枚画像投稿)で関連付けるという宣言
  has_one_attached :image
   # 1対多(複数枚画像投稿)で関連付けるという宣言
  # has_many_attached :portrailts
  
  # validates :対象のカラム名, presence(存在): true
  validates :title, presence: true
  validates :body, presence: true
  # validates :image, presence: true
end
