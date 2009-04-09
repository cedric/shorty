ActionController::Routing::Routes.draw do |map|
  
  map.with_options :controller => 'urls' do |url|
    url.root :action => 'index'
    url.short ':token', :action => 'redirect'
  end
  
end
