require 'sinatra'
require 'haml'
require 'sass'
require 'rdiscount'

RECIPE_DIR  = File.join(File.dirname(__FILE__), 'recipes')
mime_type :ttf, "application/octet-stream"

before do
 @recipe_list = Dir.glob(File.join(RECIPE_DIR, '*.md')).map do |name|
                  link = File.basename(name, '.md')
                  title = link.gsub('_', ' ').capitalize

                  { :file => name, :link => link, :title => title }
                end
end

get "/css/:stylesheet.css" do
  content_type "text/css", :charset => "UTF-8"
  sass :"css/#{params[:stylesheet]}"
end

get '/' do
  haml :index
end

get '/about' do
  haml :about
end

get '/recipes' do
  @recipe_list
  @title = 'cook'
  haml :recipes
end

get '/recipes/:recipe_name' do
  @recipe_list
  @title = 'cook'
  fn = File.join(RECIPE_DIR, "#{params[:recipe_name]}.md")
  if File.exist? fn
    @recipe = File.read(fn)
    haml :recipe
  else
    404
  end
end
