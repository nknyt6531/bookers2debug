class BookCommentsController < ApplicationController
    def create
      @book = Book.find(params[:book_id])
      @comment = current_user.book_comments.new(book_comment_params)
      @comment.book_id = @book.id
      @comment.save
      @book = @comment.book
      @book_comments = @book.book_comments
      @book_comment_new = BookComment.new
    end
    
    def destroy
      @book_comment = BookComment.find(params[:id])
      @book_comment.destroy
      @book = Book.find(params[:book_id])
      @book_comments = @book.book_comments
    end
    
    private
    def book_comment_params
      params.require(:book_comment).permit(:comment)
    end
end
