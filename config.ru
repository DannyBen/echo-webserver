require 'rack'
require 'yaml'
require 'byebug' if ENV['BYEBUG']

class Echo
  class << self
    attr_reader :env

    def call(env)
      @env = env
      req = Rack::Request.new env

      response = {}

      params = req.params
      body = req.body.read

      response['Request'] = info
      response['Request Headers'] = headers
      response['Request Params'] = params unless params.empty?
      response['Request Body'] = body unless body.empty?

      result = response.to_yaml 
      [200, {'Content-Type' => 'text/plain'}, [result]]
    end

  private

    def info
      result = env.reject do |k, v|
        k =~ /^(rack\.|puma\.|HTTP_|SERVER_|SCRIPT_NAME)/
      end
      
      result.transform_keys! do |k|
        k.split('_').map(&:capitalize).join(' ')
      end

      result.sort.to_h
    end

    def headers
      result = env.select { |k,v| k.start_with? 'HTTP_' }
      result.transform_keys! do |k|
        k.sub(/^HTTP_/, '').split('_').map(&:capitalize).join('-')
      end

      result.sort.to_h
    end

  end
end

run Echo

