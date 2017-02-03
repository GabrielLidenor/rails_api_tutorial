require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :routing do
  it { expect(get: 'api/v1/posts').to route_to('api/v1/posts#index') }
  it { expect(get: 'api/v1/posts/1').to route_to('api/v1/posts#show', id: '1') }
  it { expect(post: 'api/v1/posts').to route_to('api/v1/posts#create') }
  it { expect(put: 'api/v1/posts/1').to route_to('api/v1/posts#update', id: '1') }
  it { expect(delete: 'api/v1/posts/1').to route_to('api/v1/posts#destroy', id: '1') }  
end
