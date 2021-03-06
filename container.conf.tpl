server {
	listen 80;
	server_name {{name}}.{{domain}};
	location / {
      	proxy_redirect off;
      	proxy_set_header   X-Real-IP            $remote_addr;
      	proxy_set_header   X-Forwarded-For  $proxy_add_x_forwarded_for;
      	proxy_set_header   X-Forwarded-Proto $scheme;
      	proxy_set_header   Host                   $http_host;
      	proxy_set_header   X-NginX-Proxy    true;
		proxy_pass  http://{{name|upper}}:{{port}};
	}
}