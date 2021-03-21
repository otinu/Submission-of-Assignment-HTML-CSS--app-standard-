class Book < ApplicationRecord

 #バリデーションチェック
 #これがあると、空白文字ありの場合、NoMethodError in Books#create
 validates :title, :body, presence: true

end
