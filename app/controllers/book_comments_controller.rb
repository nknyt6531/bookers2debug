class BookCommentsController < ApplicationController
    def create
      @book_comment_new = BookComment.new
      @book = Book.find(params[:book_id])
      @comment = current_user.book_comments.new(book_comment_params)
      @comment.book_id = @book.id
      @comment.save
      @book2 = @comment.book
      @book_comments = @book2.book_comments
    end
    
    def destroy
      BookComment.find_by(id: params[:id]).destroy
    end
    
    private
    def book_comment_params
      params.require(:book_comment).permit(:comment)
    end
end
