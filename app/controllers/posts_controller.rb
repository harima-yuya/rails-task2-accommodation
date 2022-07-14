class PostsController < ApplicationController

 layout "posts"

 helper_method :sort_column, :sort_direction

   def index
    set_q
    @posts = Post.all.order("#{sort_column} #{sort_direction}")
  end

  def search
    set_q
    @results = @q.result
  end

   def show
    @post = Post.find(params[:id])
    @title = "スケジュール詳細"
   end
  def add
    @post = Post.new
    @title = "スケジュール新規登録"
  end

  def create
    @post = Post.new  post_param
    if @post.save then
      flash[:notice] = "スケジュールを新規登録しました" 
      goback
    else
      flash[:alert] = "スケジュールの更新ができませんでした"
      re = ""
      @post.errors.messages.each do |key,vals|
        vals.each do |val|
          re += "<span style='color:red'>" + val + "</span>" + "<br>"
        end
      end
      @msg = re.html_safe
      render "add"
    end
  end

  def edit
    @title = "スケジュール編集"
    @post = Post.find(params[:id])
    if request.patch? then
      @post.update(post_param)
      if @post.save then
        flash[:notice] = "ID:" + @post.id.to_s + "のスケジュールを更新しました" 
        goback
      else 
        flash[:alert] = "スケジュールの更新ができませんでした"
        re = ""
        @post.errors.messages.each do |key,vals|
           vals.each do |val|
             re += "<span style='color:red'>" + val + "</span>" + "<br>"
          end
        end
        @msg = re.html_safe
        render "edit"
      end
    end
  end

  def delete
    deleteItem = Post.find(params[:id])
    flash[:alert] = "ID:"+ deleteItem.id.to_s +  "のスケジュールを削除しました"
    deleteItem.destroy
    redirect_to "/posts"
  end

  private
  def post_param
    params.require(:post).permit(:title, :start_date, :end_date, :all_day, :memo, :image)
  end

  def goback
    redirect_to "/posts"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
    
  def sort_column
    
    Post.column_names.include?(params[:sort]) ? params[:sort] : 'id'
    
  end

  def set_q
    @q = Post.ransack(params[:q])
  end
    
end
