class BooksController < ApplicationController
  def index
    library = Library.find(params[:library_id])
    books = library.books

    render json: { library: library.name, books: books.map { |book| serialize_book(book) } }
  end

  private

  def serialize_book(book)
    if book.checked_out?
      {
        title: book.title,
        status: 'checked_out',
        user_id: book.user_id
      }
    else
      {
        title: book.title,
        status: 'available'
      }
    end
  end
end