class Item < ApplicationRecord
  validates :kind, :name, :attribution,  presence: true
  validates :name, uniqueness: true
  
# isle: 0,
# prairie: 1,
# forest: 2,
# valley: 3,
# wasteland: 4,
# vault: 5

# 感恩 gratitude
# 追光 lighteekers
# 歸屬 belonging
# 音韻 rhythm
# 魔法 enchantment
# 聖島 sanctuary
# 預言 prophecy
# 重組 assembly

  enum kind: {
    back: 0,
    cape: 1,
    hair: 2,
    face: 3,
    clothes:4,
    choker:5,
    headwear:6
  }

  enum attribution: {
    spirit: 0,
    season_spirit: 1,
    shop: 2
  }
end

# == Schema Information
#
# Table name: items
#
#  id                   :bigint           not null, primary key
#  attribution(來源)    :integer
#  description(描述)    :string
#  image_link(圖片連結) :string
#  kind                 :integer
#  name(名稱)           :string
#  rare(稀有度)         :integer
#  tag(來源補充)        :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
