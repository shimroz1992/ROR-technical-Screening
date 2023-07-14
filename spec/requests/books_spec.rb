require 'swagger_helper'

RSpec.describe 'Books API', type: :request do
  path '/libraries/{library_id}/books' do
    get 'Retrieves books for a specific library' do
      tags 'Books'
      produces 'application/json'
      parameter name: :library_id, in: :path, type: :integer, required: true

      response '200', 'Books found' do
        let(:library) { create(:library) }
        let!(:book1) { create(:book, library: library) }
        let!(:book2) { create(:book, library: library) }
        let!(:book3) { create(:book, library: library, status: 'checked_out', user_id: 1) }

        schema type: :object,
          properties: {
            library: { type: :string },
            books: {
              type: :array,
              items: {
                type: :object,
                properties: {
                  title: { type: :string },
                  status: { type: :string },
                  user_id: { type: :integer }
                }
              }
            }
          }

        run_test!
      end
    end
  end
end
