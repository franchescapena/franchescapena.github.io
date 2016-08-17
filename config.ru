require 'rubygems'
require 'sinatra'
require 'json'
require 'rack/recaptcha'
require 'pony'

use Rack::Recaptcha, :public_key => '6LcayScTAAAAAC-untYkSlbqltc7kS0NnBpTPpgl', :private_key => '6LcayScTAAAAAJHO2ZLl-W05HiNjoMnfIHbw9DBv'
helpers Rack::Recaptcha::Helpers

require './application'
run Sinatra::Application
