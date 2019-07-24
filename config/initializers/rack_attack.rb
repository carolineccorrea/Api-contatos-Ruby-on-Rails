class Rack::Attack
Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new
    # liberar chamadas para o desenvolvimento no localhost

    safelist('allow-localhost') do |req|
    
      '127.0.0.1' == req.ip || '::1' == req.ip
    
    end
    
    # limitar o numero de chamadas da api por periodo
    
    throttle('req/ip', limit: 5, period: 5) do |req|
    
      req.ip
    
    end
   end