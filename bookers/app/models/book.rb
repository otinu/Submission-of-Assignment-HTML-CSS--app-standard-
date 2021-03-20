class Book < ApplicationRecord

 #バリデーションチェック
 #これがあると、空白文字ありの場合、NoMethodError in Books#create　
 validates :本のタイトル, :感想, presence: true

end
