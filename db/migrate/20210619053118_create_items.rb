class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name, comment: "名稱"
      t.string :description, comment: "描述"
      t.integer :kind, commemt: "類型"
      t.integer :rare, comment: "稀有度"
      t.string :image_link, comment:"圖片連結"
      t.integer :attribution, comment: "來源"
      t.string :tag, comment: "來源補充"

      t.timestamps
    end
  end
end
