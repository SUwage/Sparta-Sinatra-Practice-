class PostsController < Sinatra::Base
  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  $posts = [{
  	 id: 0,
  	 title: "Post 1",
  	 body: "This is the first post"
   },
   {
      id: 1,
      title: "Post 2",
      body: "This is the second post"
    },
    {
      id: 2,
      title: "Post 3",
      body: "This is the third post"
    }]

    $animals = [{
    	 id: 0,
    	 title: "Lion",
    	 body: "This is a Lion"
     },
     {
        id: 1,
        title: "Elephant",
        body: "This is a Elephant"
      },
      {
        id: 2,
        title: "Tiger",
        body: "This is a Tiger"
      }]

  # INDEX
  get "/" do
    @title = "Blog Posts"
    @posts = $posts
        @animals = $animals
    erb :"posts/index"
  end

  # NEW
  get "/new" do
    id = params[:id].to_i
    @animal = $animals[id]

    erb :"posts/new"
  end

  # SHOW
  get "/:id" do
    id = params[:id].to_i
    @post = $posts[id]

    erb :"posts/show"
  end

  # CREATE
  post "/" do
    "This is the create route!"
  end

  # EDIT
  get "/:id/edit" do
    id = params[:id]
    "This is the show route for #{id}"
  end

  # UPDATE
  put "/:id" do
    id = params[:id]
    "This is the show route for #{id}"
  end

  # DESTROY
  delete "/:id" do
    id = params[:id]
    "This is the show route for #{id}"
  end


end
