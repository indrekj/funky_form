class PostForm < FunkyForm::Base
  model Post

  attribute :title, :type => String
  attribute :body, :type => String

  validates :title, :presence => true, :length => {:maximum => 30}
  validates :body, :presence => true, :length => {:within => 10..30}
end
