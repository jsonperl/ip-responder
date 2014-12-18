class Ip  
  def call(env)
    [200, {'Content-Type' => 'text/html'}, [ip_address(env)]]
  end

  private
  
  def ip_address(env)
    if addr = env['HTTP_X_FORWARDED_FOR']
      (addr.split(',').grep(/\d\./).first || env['REMOTE_ADDR']).to_s.strip
    else
      env['REMOTE_ADDR']
    end
  end
end
