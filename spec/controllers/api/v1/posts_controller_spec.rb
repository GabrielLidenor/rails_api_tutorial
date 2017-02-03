require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :controller do

  context 'GET #index' do
    it 'returns all the posts' do
      create_list :post, 10
      get :index
      posts = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(posts.length).to eq(10)
    end
  end

  context 'GET #show' do
    it 'returns the given post' do
      a_post = create :post
      get :show, params: { id: a_post.id }
      post_json = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(post_json["id"]).to eq(a_post.id)
    end
  end

  context 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new post' do
	a_post = build :post
	post :create, params: { post: a_post.attributes, format: :json }
      end
    end
    
    context 'with invalid parameters' do
      let(:invalid_attributes) { { name: nil } }
      it 'returns unprocessable_entity' do
        post :create, params: { post: invalid_attributes }
	expect(response.status).to eq(422)
      end
    end
  end

  context 'PUT #update' do
    context 'with valid attributes' do
      let(:new_attributes) { { title: 'testing 2' } }
      it 'updates the given post' do
        a_post = create :post
	put :update, params: { id: a_post.id, post: new_attributes }
	a_post.reload
	post_json = JSON.parse(response.body)
	expect(response.status).to eq(200)
	expect(post_json['title']).to eq('testing 2')
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) { { title: nil } }
      it 'returns unprocessable_entity status' do
        a_post = create :post
	put :update, params: { id: a_post.id, post: invalid_attributes }
	a_post.reload
	expect(response.status).to eq(422)
      end
    end
  end

  context 'PUT #destroy' do
    it 'deletes the given post' do
      a_post = create :post
      put :destroy, params: { id: a_post.id }
      expect(response.status).to eq(204)  
    end
  end
end
