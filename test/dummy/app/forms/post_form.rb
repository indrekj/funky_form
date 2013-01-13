class PostForm
  include FunkyForm

  model Post

  attribute :id, Integer
  attribute :title, String
  attribute :body, String

  validates :title, :presence => true, :length => {:maximum => 30}
  validates :body, :presence => true, :length => {:within => 10..30}
end
