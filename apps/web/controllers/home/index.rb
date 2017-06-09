module Web::Controllers::Home
  class Index
    include Web::Action
    expose :users

    def call(params)
      @users = User.all
    end
  end
end
