class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	include DeviseWhiteList
	include SetSource
	include CurrentUserConcern
end
