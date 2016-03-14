require './base'

App.routes.draw do
  get ""  => 'app#index'
  get "other" => 'app#other'
  get "favicon.ico", to: proc { [200, {}, ['']] }
end

class AppController < ApplicationController
  def index
    @model = "Controller variable works"
    render 'index'
  end
end

class User < ActiveRecord::Base
end

class Post < ActiveRecord::Base
  belongs_to :user
end
